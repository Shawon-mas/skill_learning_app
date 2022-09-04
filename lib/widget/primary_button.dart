import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class PrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String value;

  final VoidCallback? onPressed;
  const PrimaryButton({
    Key? key, required this.buttonColor, this.onPressed, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.maxFinite,
        height: 40,
        color: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(value, style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white,
        ),
        ),
        onPressed: onPressed

    );
  }
}