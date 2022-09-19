import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/text_widget.dart';
class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
   bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      body: Card(
        child: SizedBox(
          width: double.infinity,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Row(children: [
                  TextWidget(
                    value: 'Name',
                    color: BrandColors.colorBlue,
                    size: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible
                          ;
                        });
                      },
                      child: Icon(Icons.edit))
                ],),

                SizedBox(height: 5.h,),
                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,


                    hintText: 'Shawon',
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 5.h,),
                TextWidget(
                  value: 'Phone Number ',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 5.h,),
                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,


                    hintText: '01776646603',
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 5.h,),
                TextWidget(
                  value: 'Email',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 5.h,),
                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,


                    hintText: 'fhbrabby@gmail.com',
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 5.h,),
                TextWidget(
                  value: 'About me',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 5.h,),
                TextFormField(
                  enabled:isVisible? true:false,
                  initialValue: "I am smart",
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,


                  //  hintText: 'My name is shawon',
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 50, 5.0,50),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 8.h,),
                Spacer(),
                Visibility(
                  visible: isVisible,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      height: 50,
                      minWidth: double.maxFinite,
                      color: BrandColors.yellow,

                      child: Text("Update profile",style: TextStyle(
                          color: BrandColors.colorWhite,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold

                      ),),
                      onPressed: ()
                      {
                       setState(() {
                         isVisible=false;
                       });

                      }

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
