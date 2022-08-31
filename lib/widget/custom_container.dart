import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/widget/brand_color.dart';

class CustomContainer extends StatelessWidget {

  final String? value;
  final VoidCallback? onPressed;
  final Color? containerColr;
  const CustomContainer({
    Key? key, this.onPressed, this.containerColr, this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 150.w,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // <= No more error here :)
          color: containerColr,
        ),
        child: Center(
          child: Text(value!,style: GoogleFonts.nunito(
            color: BrandColors.bgColor,

          ),),
        ),
      ),
    );
  }
}