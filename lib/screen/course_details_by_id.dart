import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcourse/apimodule/api_services.dart';

import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/cousemodule/courseCart/cart_model.dart';
import 'package:vcourse/cousemodule/courseCart/cart_provider/cart_provider.dart';
import 'package:vcourse/cousemodule/courseCart/database/db_helper.dart';
import 'package:vcourse/cousemodule/models/CourseByIdModel.dart';
import 'package:vcourse/routes/routes.dart';
import 'package:vcourse/screen/test.dart';
import 'package:vcourse/widget/brand_color.dart';

import 'package:vcourse/widget/custom_button.dart';
import 'package:vcourse/widget/overview.dart';
import 'package:vcourse/widget/primary_button.dart';
import 'package:vcourse/widget/text_widget.dart';
import 'package:video_player/video_player.dart';

class CourseDetailsById extends StatefulWidget {
  final int? courseId;

  const CourseDetailsById({Key? key, this.courseId}) : super(key: key);

  @override
  State<CourseDetailsById> createState() => _CourseDetailsByIdState();
}

class _CourseDetailsByIdState extends State<CourseDetailsById> {
  String? courseDescription,
      courserRequirement,
      courserForWho,
      courseWhatWillLearn,
      courseInstructor,
      courseInstructorImage;
  DBHelper dbHelper = DBHelper();
  bool isLogging = false;
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> getWidgetsList() {
    List<Widget> bodies = [
      OverView(),
      OverView(),

      InstructorCourse(),
    ];
    return bodies;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getWidgetsList();
    final cart=Provider.of<CartProvider>(context);
    ApiServices apiServices = ApiServices();
    return Scaffold(
      backgroundColor: BrandColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: BrandColors.colorTextBlue,
            )),
        title: Text(
          'Course Details',
          style: GoogleFonts.nunito(
              color: BrandColors.colorTextBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(cartScreen);
            },
            child: Center(
              child: Badge(
                badgeContent:
                    Consumer<CartProvider>(builder: (context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: GoogleFonts.nunito(
                        color: BrandColors.colorWhite, fontSize: 12.sp),
                  );
                }),
                animationDuration: Duration(milliseconds: 300),
                child:
                    Icon(Icons.shopping_cart, color: BrandColors.colorTextBlue),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<course_model_byId>(
                future: apiServices.getCourseApiById(widget.courseId!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                        width: double.maxFinite,
                        height: 323.h,
                        child: Shimmer.fromColors(
                          baseColor: BrandColors.colorText,
                          highlightColor: BrandColors.bgColor,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //1st column
                                Container(
                                  height: 180.h,
                                  width: 323.w,
                                )
                              ],
                            ),
                          ),
                        ));
                  } else {
                    courseDescription = snapshot.data!.data!.description!;
                    courserRequirement = snapshot.data!.data!.requirments!;
                    courserForWho = snapshot.data!.data!.forwho!;
                    courseWhatWillLearn = snapshot.data!.data!.whatWillLearn!;
                    courseInstructor = snapshot.data!.data!.user!.name!;
                    courseInstructorImage =
                        snapshot.data!.data!.user!.profilePicture!;
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 150.h,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    snapshot.data!.data!.name!,
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
                                        backgroundImage: NetworkImage(
                                            'https://vcourse.net/${snapshot.data!.data!.user!.profilePicture}'),
                                        // AssetImage('assets/images/instructor_three.jpg'),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Created by',
                                            style: GoogleFonts.nunito(
                                                fontSize: 12.sp,
                                                color:
                                                    BrandColors.colorTextBlue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            snapshot.data!.data!.user!.name!,
                                            style: GoogleFonts.nunito(
                                                fontSize: 14.sp,
                                                color:
                                                    BrandColors.colorTextBlue,
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
                                  child: /* Container(
                                          color: Colors.black,
                                          height: 180.h,
                                          width: 323.w,
                                          child: TestFile(
                                            videoPlayerController:
                                                VideoPlayerController.network(
                                                    'https://vcourse.s3.ap-south-1.amazonaws.com/video1470406185.mp4'),
                                            looping: false,
                                          ),
                                        )*/
                                       Container(
                                          height: 180.h,
                                          width: 323.w,
                                          decoration: BoxDecoration(
                                              color: BrandColors.colorBrown,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://vcourse.net/${snapshot.data!.data!.thumbnail}'),
                                                  fit: BoxFit.cover)),
                                        ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  '৳${snapshot.data!.data!.price}',
                                  style: GoogleFonts.nunito(
                                      fontSize: 18.sp,
                                      color: BrandColors.colorText,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  '${snapshot.data!.data!.discount}% off',
                                  style: GoogleFonts.nunito(
                                      fontSize: 18.sp,
                                      color: BrandColors.yellow,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: PrimaryButton(
                                buttonColor: BrandColors.colorText,
                                value: isLogging ? "Enroll" : "Join and Enroll",
                                onPressed: ()
                               {
                if(isLogging)
                {
                  dbHelper.insert(
                    Cart(
                      courseId: widget.courseId,
                      courseName:snapshot.data!.data!.name,
                      courseInstructor: snapshot.data!.data!.user!.name,
                      courseImage: snapshot.data!.data!.thumbnail,
                      coursePrice: snapshot.data!.data!.price,)
                  ).then((value) {
                        print("value:"+value.toString());
                        cart.addTotalPrice(double.parse(snapshot.data!.data!.price.toString()

                        ));
                         cart.addCounter();
                    final snackBar = SnackBar(
                      backgroundColor: BrandColors.colorGreenLight,
                      content: TextWidget(
                        value: 'Course is added to cart',
                        color: BrandColors.colorWhite,
                        size: 14.sp,
                        fontWeight: FontWeight.w700,
                      ), duration: Duration(seconds: 2),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }).onError((error, stackTrace) {

                    print("Error:"+error.toString());
                    print("stackTrace: "+stackTrace.toString());
                    final snackBar = SnackBar(
                      backgroundColor: BrandColors.colorRed,
                      content: TextWidget(
                        value: 'Course is already added to cart',
                        color: BrandColors.colorWhite,
                        size: 14.sp,
                        fontWeight: FontWeight.w700,
                      ), duration: Duration(seconds: 2),);
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });




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
                                    buttonColor: BrandColors.colorPrimary,onPressed: ()
                                  {

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
              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 7,
            ),

            SizedBox(
              height: 10,
            ),
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
                backgroundImage: NetworkImage(
                    'https://vcourse.net/${courseInstructorImage}'),
                // AssetImage('assets/images/instructor_three.jpg'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                courseInstructor.toString(),
                style: GoogleFonts.nunito(
                    fontSize: 14.sp,
                    color: BrandColors.colorText,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
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

  Widget OverView(){
    ApiServices apiServices = ApiServices();
    return FutureBuilder<course_model_byId>(
      future: apiServices.getCourseApiById(widget.courseId!),
        builder: (context,snapshot)
    {
      if(!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator(),
        );
      }else{
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
              Html(data: snapshot.data!.data!.description,style: {
                "body":Style(
                  fontSize: FontSize(12.sp),
                  color: BrandColors.colorTextBlue,
                )
              },),
              Text(
                'Requirements',
                style: GoogleFonts.nunito(
                    fontSize: 18.sp,
                    color: BrandColors.colorText,
                    fontWeight: FontWeight.w700),
              ),
              Html(data:snapshot.data!.data!.requirments,style: {
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
              Html(data: snapshot.data!.data!.forwho,style: {
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
              Html(data:snapshot.data!.data!.whatWillLearn,style: {
                "body":Style(
                  fontSize: FontSize(12.sp),
                  color: BrandColors.colorText,
                )
              },),

            ],
          ),
        );
      }

    });
  }
}
