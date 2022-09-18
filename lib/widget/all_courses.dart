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
import 'package:vcourse/widget/text_widget.dart';
class AllCourse extends StatefulWidget {
  const AllCourse({Key? key}) : super(key: key);

  @override
  State<AllCourse> createState() => _AllCourseState();
}

class _AllCourseState extends State<AllCourse> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: searchController,
                onChanged: (value){
                  setState(()
                  {

                  });

                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,
                    prefixIcon:
                    Icon(Icons.search, color: BrandColors.colorPrimary),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        fontSize: 18.sp, color: BrandColors.colorText),
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
              SizedBox(height: 10,),
              TextWidget(value: "All Categories",size: 16.sp,fontWeight: FontWeight.w700,color: BrandColors.colorTextBlue),
              SizedBox(height: 10,),
              FutureBuilder<CourseModel>(
                  future: apiServices.getCourseApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: ListView.builder(

                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, index) {


                              return Shimmer.fromColors(
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
                              );
                            }),
                      );
                    } else {
                      return Container(
                        width: double.maxFinite,
                        height: 800.h,

                        child: ListView.builder(

                            shrinkWrap: true,
                            itemCount: snapshot.data?.data?.length,
                            itemBuilder: (BuildContext context, index) {
                              var dataCourse = snapshot.data!.data![index];
                              // String  nameCourse = dataCourse.name![index];
                              if(searchController.text.isEmpty){
                                return GestureDetector(
                                  onTap: () {
                                    var courseName = dataCourse.name!.toString();
                                    var courseInstructor = dataCourse.user!.name!.toString();

                                    var coursePrice = dataCourse.price!.toString();
                                    var courseDiscount = dataCourse.discount!.toString();
                                    var courseImage = dataCourse.thumbnail!.toString();
                                    var courseDescription = dataCourse.description!.toString();
                                    var courserRequirement = dataCourse.requirments!.toString();
                                    var courserForWho = dataCourse.forwho!.toString();
                                    var courseWhatWillLearn = dataCourse.whatWillLearn!.toString();
                                    var courseId=dataCourse.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CourseDetails(
                                              courseId: courseId,
                                              courseDescription:courseDescription,
                                              courseName: courseName,
                                              courseInstructor: courseInstructor,
                                              coursePrice: coursePrice,
                                              courseDisCount: courseDiscount,
                                              courseImage: courseImage,
                                              courserForWho:courserForWho,
                                              courseWhatWillLearn:courseWhatWillLearn,
                                              courserRequirement: courserRequirement,
                                            )));
                                  },
                                  child: Card(
                                    child: SizedBox(
                                      width: 300.w,
                                      height: 250.h,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          //1st column
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              height: 150.h,
                                              width: 323.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: CachedNetworkImageProvider(
                                                          'https://vcourse.net/${dataCourse.thumbnail!.toString()}'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //2nd column
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              dataCourse.name!.toString(),
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14.sp,
                                                  color: BrandColors.colorText,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //3rd column inside 3 three row
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                //1st row inside 3rd column
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      'https://vcourse.net/${dataCourse.thumbnail!.toString()}'),
                                                  // AssetImage('assets/images/instructor_three.jpg'),
                                                  backgroundColor:
                                                  Colors.transparent,
                                                ),
                                                //2nd row
                                                SizedBox(
                                                  width: 7.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      dataCourse.user!.name!
                                                          .toString(),
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 14.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "Instructor",
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                //3rd  row
                                                new Spacer(),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '৳${dataCourse.price!.toString()}',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                    Text(
                                                      '৳${dataCourse.oldPrice!.toString()}',
                                                      style: GoogleFonts.nunito(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //4th column
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        discoverLessonIcon,
                                                        height: 15.h,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        dataCourse.numberOfLessons!
                                                            .toString(),
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12.sp,
                                                            color: BrandColors
                                                                .colorTextBlue,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        discoverHoursIcon,
                                                        height: 15.h,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        dataCourse.timeDuration!
                                                            .toString(),
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12.sp,
                                                            color: BrandColors
                                                                .colorTextBlue,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              else if(dataCourse.name!.toString().toLowerCase().contains(searchController.text.toLowerCase()))
                              {
                                return GestureDetector(
                                  onTap: () {
                                    var courseName = dataCourse.name!.toString();
                                    var courseInstructor =dataCourse.user!.name!.toString();
                                    var coursePrice = dataCourse.price!.toString();
                                    var courseDiscount = dataCourse.discount!.toString();
                                    var courseImage = dataCourse.thumbnail!.toString();
                                    var courseDescription = dataCourse.description!.toString();
                                    var courserRequirement = dataCourse.requirments!.toString();
                                    var courserForWho = dataCourse.forwho!.toString();
                                    var courseWhatWillLearn = dataCourse.whatWillLearn!.toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CourseDetails(
                                                courseDescription:courseDescription,
                                                courseName: courseName,
                                                courseInstructor: courseInstructor,
                                                coursePrice: coursePrice,
                                                courseDisCount: courseDiscount,
                                                courserForWho:courserForWho,
                                                courseWhatWillLearn:courseWhatWillLearn,
                                                courserRequirement: courserRequirement,
                                                courseImage: courseImage)));
                                  },
                                  child: Card(
                                    child: SizedBox(
                                      width: 300.w,
                                      height: 323.h,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          //1st column
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              height: 180.h,
                                              width: 323.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://vcourse.net/${dataCourse.thumbnail!.toString()}'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //2nd column
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              dataCourse.name!.toString(),
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14.sp,
                                                  color: BrandColors.colorText,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //3rd column inside 3 three row
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                //1st row inside 3rd column
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      'https://vcourse.net/${dataCourse.thumbnail!.toString()}'),
                                                  // AssetImage('assets/images/instructor_three.jpg'),
                                                  backgroundColor:
                                                  Colors.transparent,
                                                ),
                                                //2nd row
                                                SizedBox(
                                                  width: 7.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      dataCourse.user!.name!
                                                          .toString(),
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 14.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "Instructor",
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                //3rd  row
                                                new Spacer(),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '৳${dataCourse.price!.toString()}',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                    Text(
                                                      '৳${dataCourse.oldPrice!.toString()}',
                                                      style: GoogleFonts.nunito(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 12.sp,
                                                          color: BrandColors
                                                              .colorTextBlue,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //4th column
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        discoverLessonIcon,
                                                        height: 15.h,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        dataCourse.numberOfLessons!
                                                            .toString(),
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12.sp,
                                                            color: BrandColors
                                                                .colorTextBlue,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        discoverHoursIcon,
                                                        height: 15.h,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        dataCourse.timeDuration!
                                                            .toString(),
                                                        style: GoogleFonts.nunito(
                                                            fontSize: 12.sp,
                                                            color: BrandColors
                                                                .colorTextBlue,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }else{
                                return Container();
                              }

                            }),
                      );
                    }
                  }),



            ],
          ),
        ),
      ),
    );
  }
}
