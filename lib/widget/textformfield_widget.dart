import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcourse/widget/brand_color.dart';
class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final String? secondaryErrorText;
  final IconData iconData;
  final TextInputType type;

  const TextFieldWidget({
    Key? key,
    required this.controller,  required this.hintText,  this.errorText,
    required this.iconData, required this.type, this.secondaryErrorText,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: BrandColors.colorWhite,

        prefixIcon: Icon(
            iconData,
            color: Color.fromRGBO(0, 48, 73, 0.5)
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
        contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0,
            style: BorderStyle.none,),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value){
        if(value!.isEmpty){
          return errorText;
        }else if(value.contains('@')){
          return errorText;
        }
        else{
          return null;
        }
      },
    );
  }
}