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
                  const Spacer(),
                  InkWell(
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible
                          ;
                        });
                      },
                      child: Icon(Icons.edit,size: 30,))
                ],),
                SizedBox(height: 7.h,),
                TextFormField(
                  enabled:isVisible? true:false,
                  initialValue: "Shawon",
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 7.h,),
                TextWidget(
                  value: 'Phone Number ',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 7.h,),
                TextFormField(
                  enabled:isVisible? true:false,
                  initialValue: "01776646603",
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 7.h,),
                TextWidget(
                  value: 'Email',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 7.h,),
                TextFormField(
                  enabled:isVisible? true:false,
                  initialValue: "fhbrabby@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value){

                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.bgColor,
                    hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                    contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0,
                        style: BorderStyle.none,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
                SizedBox(height: 7.h,),
                TextWidget(
                  value: 'About me',
                  color: BrandColors.colorBlue,
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 7.h,),
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

                Visibility(
                  visible: isVisible,
                  child: Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
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
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
