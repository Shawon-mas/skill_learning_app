import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/models/courses.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        'How to Write an Effective Research Paper', 'assets/images/three.jpg', 'Md. Mehedi Hassan',
        'assets/images/instructor_three.jpg', 0, 6, 0,'CEO & Instructor',discoverLessonIcon,discoverHoursIcon),

    Courses('WordPress BootCamp', 'assets/images/one.jpg', 'Jarif Huda Angon',
        'assets/images/instructor_one.png', 50, 15, 0,'CTO & Instructor',discoverLessonIcon,discoverHoursIcon),

    Courses('Graphic & UI/UX Design', 'assets/images/two.jpg', 'Ishtiuq Ahmed',
        'assets/images/instructor_two.jpg', 999, 6, 0,'Instructor',discoverLessonIcon,discoverHoursIcon),
    Courses(
        'How to Write an Effective Research Paper', 'assets/images/three.jpg', 'Md. Mehedi Hassan',
        'assets/images/instructor_three.jpg', 1000, 6, 0,'CEO & Instructor',discoverLessonIcon,discoverHoursIcon),
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
            height: 330.h,
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
                          Flexible(
                            flex: 5,
                            fit:FlexFit.loose,
                            child: Image.asset(
                              course.courseImage.toString(),
                              fit: BoxFit.cover,
                              height: 180,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            fit:FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                course.courseName.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  color:BrandColors.colorText,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            fit:FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        course.courseIntstructorImage.toString()),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${course.courseIntstructor}',style: GoogleFonts.nunito(
                                        fontSize: 14.sp,
                                        color: BrandColors.colorTextBlue,
                                        fontWeight: FontWeight.w400
                                      ),),
                                      Text('${course.courseIntstructorDesgination}',style: GoogleFonts.nunito(
                                          fontSize: 12.sp,
                                          color: BrandColors.colorTextBlue,
                                          fontWeight: FontWeight.w400
                                      ),),
                                    ],
                                  ),
                                  Text(
                                    '৳${course.coursePrice.toString()}',
                                    style: GoogleFonts.nunito(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12.sp,
                                        color: BrandColors.colorTextBlue,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),


                          /*Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:<Widget>
                              [
                                Row(
                                  children:
                                  [
                                    SvgPicture.asset(course.lessonImage.toString(),
                                    height: 15.h,),
                                    SizedBox(width: 5.w,),
                                    Text('${course.courseLesson} lesson',style: GoogleFonts.nunito(
                                        fontSize: 12.sp,
                                        color: BrandColors.colorTextBlue,
                                        fontWeight: FontWeight.w400
                                    ),),

                                  ],
                                ),

                                Row(
                                  children:<Widget>
                                  [
                                    SvgPicture.asset(course.hoursImage.toString(),
                                      height: 15.h,),
                                    SizedBox(width: 5.w,),
                                    Text('${course.courseDuration} hours',style: GoogleFonts.nunito(
                                        fontSize: 12.sp,
                                        color: BrandColors.colorTextBlue,
                                        fontWeight: FontWeight.w400
                                    ),),

                                  ],
                                ),
                              ],
                            ),
                          )*/
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
        color: BrandColors.bgColor,
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
   Column(
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

                                Text(
                                  '৳${course.coursePrice.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
   */

}
