import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcourse/apimodule/api_services.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/models/learning.dart';
import 'package:vcourse/routes/routes.dart';
import 'package:vcourse/screen/course_details.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/custom_container.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<Learning> learning = [
    Learning(discoverLessonIcon, discoverLiveText, discoverLiveDesText),
    Learning(discoverAccess, discoverLifeTimeText, discoverLifeTimeDesText),
  ];
  TextEditingController searchController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
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
                controller: searchController,
                onChanged: (value){
                     setState(()
                     {

                     });

                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
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
                InkWell(
                  onTap: ()
                  {
                    Get.toNamed(allcourse);
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.nunito(
                      color: BrandColors.colorText,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: FutureBuilder<CourseModel>(
                future: apiServices.getCourseApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      width: double.maxFinite,
                      height: 323.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
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
                      height: 323.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
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
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discoverLearnText,
                  style: GoogleFonts.nunito(
                    color: BrandColors.colorText,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 200.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: learning.length,
                  itemBuilder: (BuildContext context, int index) {
                    var learningList = learning[index];
                    return Card(
                      child: SizedBox(
                        width: 293.w,
                        height: 160.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                learningList.learningImage.toString(),
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                learningList.learningTitle.toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 14.sp,
                                    color: BrandColors.colorTextBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                learningList.learningDes.toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 12.sp,
                                    color: BrandColors.colorTextBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
