import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/screen/test.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/course_instructor.dart';
import 'package:vcourse/widget/custom_button.dart';
import 'package:vcourse/widget/overview.dart';
import 'package:vcourse/widget/primary_button.dart';
import 'package:vcourse/widget/primary_toolbar.dart';




class CourseDetails extends StatefulWidget {
  final String courseName, courseInstructor,  coursePrice,
      courseDisCount,courseImage,courseDescription,courserRequirement,
      courserForWho,courseWhatWillLearn;

  const CourseDetails(
      {Key? key,
      required this.courseName,
      required this.courseInstructor,

      required this.coursePrice, required this.courseDisCount, required this.courseImage,  required this.courseDescription, required this.courserRequirement, required this.courserForWho, required this.courseWhatWillLearn})
      : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {


   bool isLogging=true;
  late dynamic  total;
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    total=widget.courseDescription;


  }



   static Widget pageWidget(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
    );
  }

  List<Widget> getWidgetsList(){

    List<Widget> bodies = [
      OverView(value_one: widget.courseDescription,value_two:widget.courserRequirement,value_three: widget.courserForWho,value_four: widget.courseWhatWillLearn ,
          number: groupValue),
      OverView(value_one: widget.courseDescription,value_two:widget.courserRequirement,value_three: widget.courserForWho,value_four: widget.courseWhatWillLearn ,
          number: groupValue),
      InstructorCourse(),


    ];
    return bodies;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets =  getWidgetsList();
    return Scaffold(
      backgroundColor: BrandColors.bgColor,
      appBar: CustomToolbar(
        value: "Course",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 150.h,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.courseName,
                      style: GoogleFonts.nunito(
                          fontSize: 18.sp,
                          color: BrandColors.colorText,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage('https://vcourse.net/${widget.courseImage}'),
                          // AssetImage('assets/images/instructor_three.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Created by',
                              style: GoogleFonts.nunito(
                                  fontSize: 12.sp,
                                  color: BrandColors.colorTextBlue,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.courseInstructor,
                              style: GoogleFonts.nunito(
                                  fontSize: 14.sp,
                                  color: BrandColors.colorTextBlue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 180.h,
              width: 323.w,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [

                  Positioned(
                    top: -50,
                    child: Container(
                      height: 180.h,
                      width: 323.w,
                       decoration: BoxDecoration(
                         color: BrandColors.colorBrown,
                          image: DecorationImage(
                              image: NetworkImage('https://vcourse.net/${widget.courseImage}'),
                              fit: BoxFit.cover)
                       ),
                    ),
                    /*Container(
                                color: Colors.black,
                              height: 180.h,
                               width: 323.w,
                               child: TestFile(videoPlayerController: VideoPlayerController.network(widget.courseVideo),looping: false,),

                    ),*/
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(

                children: [
                  Text(
                    '৳${widget.coursePrice}',
                    style: GoogleFonts.nunito(
                        fontSize: 18.sp,
                        color: BrandColors.colorText,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    '${widget.courseDisCount}% off',
                    style: GoogleFonts.nunito(
                        fontSize: 18.sp,
                        color: BrandColors.yellow,
                        fontWeight: FontWeight.w700),
                  ),
                ],

              ),
            ),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PrimaryButton(buttonColor: BrandColors.colorText, value: isLogging?"Enroll":"Join and Enroll",onPressed: ()
              {
                if(isLogging)
                {

                }else{
                 //  Get.snackbar("You are not eligible for enroll", "Please login for enrolling");
                  Get.bottomSheet(Container(
                    height: 180.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                      color: BrandColors.bgColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseDetailsWarningText,
                            style: GoogleFonts.nunito(
                                fontSize: 18.sp,
                                color: BrandColors.colorText,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            courseDetailsWarningTextLogging,
                            style: GoogleFonts.nunito(
                                fontSize: 18.sp,
                                color: BrandColors.colorTextBlue,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                                  child: CustomButton(
                                    value: "Sign Up",
                                    buttonColor: BrandColors.colorPrimary,onPressed: (){

                                  },),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                                  child: CustomButton(
                                    value: "Sign In",
                                    buttonColor: BrandColors.yellow,onPressed: (){

                                  },),
                                ),
                              ),
                            ],
                          )
                        ],

                      ),
                    ),

                  )

                  );
                }
              },),
            ),
            SizedBox(height: 10,),
            Container(
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
                            0: buildSegment("Overview"),
                            1: buildSegment("Curriculum"),
                            2: buildSegment("Instructor"),
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

 Widget InstructorCourse() {
    return Card(
      child: SizedBox(
        width: double.maxFinite,
        height: 200.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://vcourse.net/${widget.courseImage}'),
                // AssetImage('assets/images/instructor_three.jpg'),
                backgroundColor:
                Colors.transparent,
              ),
              SizedBox(height: 10.h,),
              Text(
                widget.courseInstructor,
                style: GoogleFonts.nunito(
                    fontSize: 14.sp,
                    color: BrandColors.colorText,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h,),
              Text(
                'Instructor',
                style: GoogleFonts.nunito(
                    fontSize: 12.sp,
                    color: BrandColors.colorTextBlue,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
