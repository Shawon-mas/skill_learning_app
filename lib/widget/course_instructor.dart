
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/widget/brand_color.dart';

class CourseInstructor extends StatefulWidget {
  final CircleAvatar instructorImage;
  final String instructorName;
  final String instructorDesignation;

  const CourseInstructor({Key? key, required this.instructorImage, required this.instructorName, required this.instructorDesignation}) : super(key: key);

  @override
  State<CourseInstructor> createState() => _CourseInstructorState();
}

class _CourseInstructorState extends State<CourseInstructor> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.maxFinite,
        height: 323.h,
        child: Column(

          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://vcourse.net/${widget.instructorImage}'),
              // AssetImage('assets/images/instructor_three.jpg'),
              backgroundColor:
              Colors.transparent,
            ),
            SizedBox(height: 10.h,),
            Text(
              widget.instructorName,
              style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  color: BrandColors.colorText,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h,),
            Text(
              widget.instructorDesignation,
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  color: BrandColors.colorTextBlue,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
