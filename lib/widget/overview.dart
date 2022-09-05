import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/widget/brand_color.dart';

class OverView extends StatefulWidget {
  final String value;
  final int number;
  const OverView({Key? key, required this.value, required this.number}) : super(key: key);

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Description',
            style: GoogleFonts.nunito(
                fontSize: 18.sp,
                color: BrandColors.colorText,
                fontWeight: FontWeight.w700),
          ),
          Html(data: widget.value,style: {
            "body":Style(
              fontSize: FontSize(12.sp),
              color: BrandColors.colorText,
            )
          },),
          Text(
            'Requirements',
            style: GoogleFonts.nunito(
                fontSize: 18.sp,
                color: BrandColors.colorText,
                fontWeight: FontWeight.w700),
          ),
          Html(data: widget.value,style: {
            "body":Style(
              fontSize: FontSize(12.sp),
              color: BrandColors.colorText,
            )
          },),
          Text(
            'Who This Course is For',
            style: GoogleFonts.nunito(
                fontSize: 18.sp,
                color: BrandColors.colorText,
                fontWeight: FontWeight.w700),
          ),
          Html(data: widget.value,style: {
            "body":Style(
              fontSize: FontSize(12.sp),
              color: BrandColors.colorText,
            )
          },),
          Text(
            'What You Will be Learn',
            style: GoogleFonts.nunito(
                fontSize: 18.sp,
                color: BrandColors.colorText,
                fontWeight: FontWeight.w700),
          ),
          Html(data: widget.value,style: {
            "body":Style(
              fontSize: FontSize(12.sp),
              color: BrandColors.colorText,
            )
          },),

        ],
      ),
    );
  }
}
