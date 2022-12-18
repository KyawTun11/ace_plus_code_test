import 'package:ace_plus_code_test/app/data/api_model/user_interface_model.dart';
import 'package:ace_plus_code_test/app/data/repository/repository_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  final RepositoryController _repositoryController = RepositoryController.to;

  List<UserModel> userModel = [];

  var idLoading = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    loadUserList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void loadUserList() async {
    try {
      List<UserModel> response = await _repositoryController.getUserList();
      if (response.isNotEmpty) {
       userModel = response;
      } else {
        EasyLoading.showError("Something Error");
      }
    } catch (e) {
      print(e);
    } finally {
      idLoading.value = false;
      update();
    }
  }
}
