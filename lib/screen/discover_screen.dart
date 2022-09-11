

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/categories_list.dart';
import 'package:vcourse/widget/course_list.dart';
import 'package:vcourse/widget/intructor_list.dart';



class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

  int groupValue = 0;
  List<Widget> getWidgetsList(){

    List<Widget> bodies = [
      CourseList(),
      InstructorList(),
      CategoriesList()
    ];
    return bodies;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets =  getWidgetsList();
    return Scaffold(
      backgroundColor: BrandColors.bgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(color: BrandColors.colorText),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: BrandColors.colorText,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: BrandColors.bgColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  CupertinoSegmentedControl<int>(
                      padding: EdgeInsets.all(10),
                      groupValue: groupValue,
                      selectedColor: BrandColors.yellow,
                      unselectedColor: new Color(0xffF1F2F6),
                      borderColor: BrandColors.yellow,
                      children: {
                        0: buildSegment("Courses"),
                        1: buildSegment("Instructor"),
                        2: buildSegment("Categories"),
                      },
                      onValueChanged: (chageValue) {
                        print(chageValue);
                        setState(() {
                          this.groupValue = chageValue;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              widgets[groupValue],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) => Container(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: 18.sp),
        ),
      );


}
