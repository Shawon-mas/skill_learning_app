import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/models/courses.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_toolbar.dart';

class CourseDetails extends StatefulWidget {
  final String courseName;
  const CourseDetails({Key? key, required this.courseName}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomToolbar(value: "Course",),
      body: Column(
        children: [
        Container(
        width: double.maxFinite,
        height: 150.h,
        color: Colors.white,
        child: Column(
            children: [
            Text(
              widget.courseName,
                 style: GoogleFonts.nunito(
            fontSize: 14.sp,
            color: BrandColors.colorText,
            fontWeight: FontWeight.w600
        ),
            )
        ],
      ),

    )],
    )
    ,
    );
  }
}


