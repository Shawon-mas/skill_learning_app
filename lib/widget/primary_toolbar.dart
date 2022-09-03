import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vcourse/widget/brand_color.dart';
class CustomToolbar extends StatelessWidget with PreferredSizeWidget{
  final String value;
  CustomToolbar({
    Key? key, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(
          value, style: TextStyle(color: BrandColors.colorText)
      ),
      leading: IconButton(
        icon:  Icon(
          Icons.arrow_back,
          color: BrandColors.colorText,
        ),

        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
    );

  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

