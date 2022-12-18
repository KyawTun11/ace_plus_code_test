import 'package:flutter/material.dart';

import '../../../constants/my_style.dart';

class UserWidget extends StatelessWidget {
  UserWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.webSite,
    required this.onTap,
  }) : super(key: key);
  String name;
  String email;
  String phone;
  String webSite;
  String address;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
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
                name,
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
                  email,
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
                  phone,
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
                  webSite,
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
                  address,
                  style: subTitleTextStyle,
                ),
              ],
            ),
          ],
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(name),
        //     const SizedBox(height: 4),
        //     Text(email),
        //     const SizedBox(height: 4),
        //     Text(phone),
        //     const SizedBox(height: 4),
        //     Text(webSite),
        //     const SizedBox(height: 4),
        //     Text(
        //       address,
        //       maxLines: 1,
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
