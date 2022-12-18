import 'package:ace_plus_code_test/app/data/api_service/api_service.dart';
import 'package:get/get.dart';

import '../api_model/user_interface_model.dart';

class RepositoryController extends GetxController{
  static RepositoryController to = Get.find();
  late ApiService apiService;
  @override
  void onInit() {
    apiService = ApiService.create();
    super.onInit();
  }

  Future<List<UserModel>> getUserList() async {
    try {
      return await apiService.getUserModel();
    } catch (e) {
      print(e);
    }
    return getUserList();
  }
}