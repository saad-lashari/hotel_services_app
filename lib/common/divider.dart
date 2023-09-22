import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/controller/theme_controller.dart';

class CustomDivider extends StatelessWidget {
  final double padding;
  const CustomDivider({this.padding = 5, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: GetBuilder<ThemeController>(builder: (con) {
        return Divider(
            height: 0,
            thickness: 1,
            color: con.darkTheme ? Colors.grey[800] : Colors.grey[300]!);
      }),
    );
  }
}
