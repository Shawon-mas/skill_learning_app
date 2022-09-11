import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/models/instructor.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/primary_button.dart';
import 'package:vcourse/widget/text_widget.dart';
class InstructorList extends StatefulWidget {
  const InstructorList({Key? key}) : super(key: key);

  @override
  State<InstructorList> createState() => _InstructorListState();
}

class _InstructorListState extends State<InstructorList> {
  List<Instructor> instructor=[
    Instructor(instructorOne,instructorOneName,instructorOneTitle,fb,linkedin),
    Instructor(instructorTwo,instructorTwoName,instructorTwoTitle,fb,linkedin),
    Instructor(instructorThree,instructorFourName,instructorFourTitle,fb,linkedin),
  ];
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PrimaryButton(value: "Apply As Instructor",buttonColor: BrandColors.colorText,onPressed: (){},),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(

                  shrinkWrap: true,
                  itemCount: instructor.length,

                  itemBuilder: (BuildContext contex,int index){
                    var instructorList=instructor[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(

                        children: [
                          CircleAvatar(
                            radius: 50.h,
                            backgroundColor: BrandColors.yellow,
                            child: CircleAvatar(
                              radius: 48.h,
                              backgroundImage: AssetImage(instructorList.instructorImage.toString()),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(color: BrandColors.colorText,
                                value:instructorList.instructorName.toString() ,
                                fontWeight: FontWeight.w600,
                              size: 16.sp,),
                              TextWidget(color: BrandColors.colorText,
                                value:instructorList.instructorTitle.toString() ,
                                fontWeight: FontWeight.w600,
                                size: 12.sp,),
                              Row(
                                children: [
                                  SvgPicture.asset(instructorList.instructorFacebook.toString()),
                                  SizedBox(width: 10,),
                                  SvgPicture.asset(instructorList.instructorLinkedin.toString())
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            )

          ],
        ),


    );
  }
}
/*
  scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PrimaryButton(value: "Apply As Instructor",buttonColor: BrandColors.colorText,onPressed: (){},),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: instructor.length,
              itemBuilder: (BuildContext contex,int index){
                var instructorList=instructor[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: SvgPicture.asset('assets/images/fb.svg')
                  ),
                  title: Text(instructorList.instructorName.toString()),
                );
              }
          )

        ],
      ),
 */
