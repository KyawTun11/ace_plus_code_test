import 'package:ace_plus_code_test/app/data/api_model/user_interface_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController
  late UserModel user;
  final count = 0.obs;
  @override
  void onInit() {
    user = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
