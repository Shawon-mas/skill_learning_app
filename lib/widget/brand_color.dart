import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandColors {
  static const Color colorPrimary = Color(0xFF0A4A7B);
  static const Color lightYellow = Color(0xFFFFFCEA);
  static const Color colorPrimaryDark = Color(0xFF171430);
  static const Color colorText = Color(0xFF0A4A7B);
  static const Color colorBrown = Color(0xFFFE7F2D);
  static const Color colorGreenLight = Color(0xFF38B000);
  static const Color colorBlue= Color(0xFF003049);
  static const Color colorTextBlue= Color(0xFF003049);
  static const Color yellow = Color(0xffECA820);
  static const Color bgColor = Color(0xffF1F2F6);
  static const Color colorWhite = Color(0xffffffff);


  myStyle(double size, [Color? color, FontWeight? fw]) {
    return GoogleFonts.nunito(
      fontSize: size,
      color: color,
      fontWeight: fw,
    );
  }

}