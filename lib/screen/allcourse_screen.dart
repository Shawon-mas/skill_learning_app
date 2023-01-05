import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcourse/apimodule/api_services.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/screen/course_details.dart';

import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
import 'package:vcourse/widget/text_widget.dart';

class AllCourseScreen extends StatefulWidget {
  const AllCourseScreen({Key? key}) : super(key: key);

  @override
  State<AllCourseScreen> createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen> {
  /**/
  TextEditingController searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // defaultChoiceIndex = 0;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomToolbar(value: 'All courses'),
      body:Container(),
    );
  }


}
/*
late int defaultChoiceIndex;
  List<String> _choicesList = [
    "All Courses",
    "Programming",
    "Computer",
    "Marketing",
    "Photography",
    "Development",
    "Design",
    "Research & Development"
  ];

 defaultChoiceIndex==null
              ?Container()
              :Text('${_choicesList[defaultChoiceIndex]}'),
              ================
 Widget chip() {
    return Wrap(
      spacing: 8,
      children: List.generate(_choicesList.length, (index) {
        return ChoiceChip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            _choicesList[index],
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black54, fontSize: 14),
          ),
         backgroundColor: BrandColors.bgColor,
          selected: defaultChoiceIndex == index,
          selectedColor: BrandColors.colorLightBlue,
          onSelected: (value) {
            setState(() {
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          // backgroundColor: color,
          elevation: 1,
          padding: EdgeInsets.symmetric(horizontal: 5),
        );
      }),
    );
  }
 */
