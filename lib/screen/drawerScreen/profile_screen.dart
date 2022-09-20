import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/intructor_list.dart';
import 'package:vcourse/widget/myprofile_widget.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
import 'package:vcourse/widget/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  String? imagePath;
  File? _image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      final imageTemp = File(image!.path);
      setState(() {
        _image = imageTemp;
        saveImage(_image!.path);
      });
    } on PlatformException catch (e) {
      print('Failed: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomToolbar(value: 'My Profile'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      imagePath != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(File(imagePath!)),
                              radius: 80,
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: _image != null
                                  ? Image.file(_image!).image
                                  : NetworkImage('https://cutt.ly/yVi8MKf'),
                            ),
                      Positioned(
                          bottom: 0,
                          right: 4,
                          child: InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: buildEditIcon())),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      value: "Shawon",
                      color: BrandColors.colorTextBlue,
                      size: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    TextWidget(
                      value: "Student",
                      color: BrandColors.colorText,
                      size: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: TabBar(
                  controller: tabController,
                  labelColor: BrandColors.colorText,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: BrandColors.colorTextBlue,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 15,right: 15),
                  tabs: [
                    Tab(text: 'My Profile',),
                    Tab(text: 'Enrolled Courses',),
                    Tab(text: 'Completed Courses',),
                    Tab(text: 'Running Courses',),
                  ]
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,top: 15,right: 15),
              width: double.maxFinite,
              height: 500,
              child: TabBarView(
                controller: tabController,

                children: [
                  MyProfileWidget(),
                  TextWidget(
                    value: "Enrolled Courses",
                    color: BrandColors.colorText,
                    size: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    value: "Completed Courses",
                    color: BrandColors.colorText,
                    size: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    value: "Running Courses",
                    color: BrandColors.colorText,
                    size: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(height: height*.3,),
          ],
        ),
      ),
    );
  }

  void saveImage(String path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString("imagepath", path);
  }

  void loadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      imagePath = saveImage.getString("imagepath");
    });
  }
}

Widget buildEditIcon() {
  return ClipOval(
    child: Container(
      color: BrandColors.colorWhite,
      padding: EdgeInsets.all(2),
      child: ClipOval(
        child: Container(
            padding: EdgeInsets.all(8),
            color: BrandColors.colorLightBlue,
            child: Icon(
              Icons.edit,
              size: 20,
              color: Colors.white,
            )),
      ),
    ),
  );
}
