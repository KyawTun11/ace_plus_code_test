import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/my_style.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    var user = controller.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name!),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Text(
                  user.name![0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Table(
              columnWidths: const {
                0: FractionColumnWidth(0.2),
                1: FractionColumnWidth(0.1),
                2: FractionColumnWidth(0.70)
              },
              children: [
                TableRow(
                  children: [
                    Text(
                      "Name",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      user.name!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Email",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      user.email!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Phone",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      user.phone!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Company",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      user.company!.name!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Website",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      user.website!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Address",
                      style: titleTextStyle,
                    ),
                    const Text(":"),
                    Text(
                      '${user.address!.street}, ${user.address!.suite}, ${user.address!.city}',
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
