import 'dart:async';
import 'dart:convert';
import 'package:ace_plus_code_test/app/data/api_service/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api_model/user_interface_model.dart';

class RepositoryController extends GetxController {
  static RepositoryController to = Get.find();
  late ApiService apiService;
  final storage = GetStorage();

  @override
  void onInit() {
    apiService = ApiService.create();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> hasInternetConniection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      print("Have Connection..");
      return true;
    } else {
      print("Net work Error");
      return false;
    }
  }

  Future<List<UserModel>> getUserList() async {
    try {
      if (await hasInternetConniection()) {
        List<UserModel> data = await apiService.getUserModel();

        await saveUserData(data);

        return data;
      }
    } catch (e) {
      print(e);
    }

    return loadUserData();
  }

  List<UserModel> loadUserData() {

    List<UserModel> userData = [];

    if(storage.hasData('userData')){
      var result = storage.read('userData');
      dynamic jsonData = jsonDecode(result);
      jsonData.map((d) => userData.add(UserModel.fromJson(d))).toList();
    }

    return userData;
  }

  Future<void> saveUserData(List<UserModel> data) async {
    var userdataAsMap = data.map((d) => d.toJson()).toList();
    String jsonString = jsonEncode(userdataAsMap);
    await storage.write('userData', jsonString);
  }
}
