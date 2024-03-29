import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextWidget extends StatelessWidget {
  final String value;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  const TextWidget({
    Key? key, required this.value, required this.size, required this.fontWeight, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(value,
      style: GoogleFonts.nunito(
          fontSize: size,
          fontWeight: fontWeight,
          color: color
      ),);
  }
}
