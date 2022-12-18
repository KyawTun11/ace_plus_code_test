import 'package:ace_plus_code_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widget/user_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.idLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.userModel.isEmpty
                  ? const Center(
                      child: Text("No user data to show!"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.userModel.length,
                      itemBuilder: (context, index) {
                        var user = controller.userModel[index];
                        return UserWidget(
                          name: 'Name : ${user.name}',
                          email: 'Email : ${user.email}',
                          phone: 'Phone : ${user.phone}',
                          webSite: 'WebSite : ${user.website}',
                          address:
                              'Address : ${user.address!.street}, ${user.address!.suite}, ${user.address!.city}',
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL,
                              arguments: user,
                            );
                          },
                        );
                      });
        },
      ),
    );
  }
}
