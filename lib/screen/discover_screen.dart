import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:vcourse/models/courses.dart';

import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/custom_container.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int groupValue = 0;

  static Widget pageWidget(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
    );
  }

  static List<Courses> courseList = [
    Courses(
        'How to Write an Effective Research Paper', 'assets/images/three.jpg', 'Md. Mehedi Hassan', 'assets/images/instructor_three.jpg', 0, 6, 0),
    Courses('WordPress BootCamp', 'assets/images/one.jpg', 'Jarif Huda Angon',
        'assets/images/instructor_one.png', 850, 15, 0),
    Courses('Graphic & UI/UX Design', 'assets/images/two.jpg', 'Ishtiuq Ahmed',
        'assets/images/instructor_two.jpg', 1999, 6, 0)
  ];

  List<Widget> bodies = [
    coursList(),
    pageWidget("Instructor Page"),
    pageWidget("Categories Page"),
  ];

  static Widget coursList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Browse by Categories",
            style: GoogleFonts.nunito(
                fontSize: 18.sp,
                color: BrandColors.colorBlue,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(
                  onPressed: () {
                    print("Design Clicked");
                  },
                  containerColr: BrandColors.colorBlue,
                  value: "Design",
                ),
                SizedBox(
                  width: 10,
                ),
                CustomContainer(
                  onPressed: () {
                    print("Next Clicked");
                  },
                  containerColr: BrandColors.colorBrown,
                  value: "Programming",
                ),
                SizedBox(
                  width: 10,
                ),
                CustomContainer(
                  onPressed: () {
                    print("Next Clicked");
                  },
                  containerColr: BrandColors.colorGreenLight,
                  value: "Photography",
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 2, offset: Offset(1, 1))
            ]),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon:
                      Icon(Icons.search, color: BrandColors.colorPrimary),
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 18.sp, color: BrandColors.colorText),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Popular Courses',
                style: GoogleFonts.nunito(
                  color: BrandColors.colorText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                'See All',
                style: GoogleFonts.nunito(
                  color: BrandColors.colorText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: courseList.length,

                itemBuilder: (BuildContext context, int index) {
                  var course = courseList[index];
                  return Card(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            course.courseImage.toString(),
                            fit: BoxFit.cover,
                            height: 180,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              course.courseName.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      course.courseIntstructorImage.toString()),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${course.courseIntstructor}'),
                                    Text('${course.courseIntstructor}'),
                                  ],
                                ),
                              SizedBox(width: 90,),
                                Text(
                                  '৳${course.coursePrice.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(color: BrandColors.colorText),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: BrandColors.colorText,
          ),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: BrandColors.colorBackground,
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
            bodies[groupValue],
          ],
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
/*
  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [

                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(course.courseIntstructorImage.toString()),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${course.courseIntstructor}'),
                                    Text('${course.courseIntstructor}'),
                                  ],
                                ),
                                Text(
                                  '৳${course.coursePrice.toString()}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(

                              children: [
                                Text(
                                  '${course.courseLesson.toString()} Lessons',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                Text(
                                  '${course.courseLesson.toString()} Lessons',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          )
   */

}
