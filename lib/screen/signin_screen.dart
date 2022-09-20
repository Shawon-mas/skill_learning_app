

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/utilites/utils.dart';

import 'package:vcourse/routes/routes.dart';

import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/text_widget.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  Color btnColor = Colors.white;
  Color btnText = BrandColors.colorGrey;
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData=MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(

        backgroundColor: BrandColors.bgColor,
        body: Column(
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: GestureDetector(onTap: (){
                    Get.back();
                  },
                      child: Icon(Icons.arrow_back,color: BrandColors.colorTextBlue,)),
                ),
                SizedBox(height: 40.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextWidget(
                    value: welcomeTextSignIn,
                    fontWeight: FontWeight.w300,
                    color: BrandColors.yellow,
                    size: 30.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextWidget(
                    value: welcomeSignInTextSignIn,
                    fontWeight: FontWeight.w600,
                    color: BrandColors.colorTextBlue,
                    size: 30.sp,
                  ),
                ),

                SizedBox(height: 30.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(

                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0// Shadow position
                          ),
                        ],
                      ),
                      child: TextFormField(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value){
                          Utils.fieldFocusedChage(context, emailFocusNode, passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: BrandColors.colorWhite,

                          prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(0, 48, 73, 0.5)
                          ),
                          hintText: signInEmailHint,
                          hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                          contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                      ),
                    ),


                  ),
                ),
                SizedBox(height: 20.h,),
                //2nd textField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0// Shadow position
                          ),
                        ],
                      ),
                      child: TextFormField(
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: _isObscure,
                        onChanged: (text){
                          if(passwordController.text.isEmpty){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else if (passwordController.text.length<6){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else{
                            setState(() {
                              btnColor = BrandColors.yellow;
                              btnText = BrandColors.colorWhite;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                            fillColor: BrandColors.colorWhite,
                            prefixIcon: Icon(
                                Icons.lock_open_rounded,
                                color: Color.fromRGBO(0, 48, 73, 0.5)
                            ),
                            suffixIcon: IconButton(onPressed: ()
                            {
                              setState(() {
                                _isObscure = !_isObscure;
                              });

                            }, icon: Icon(_isObscure?Icons.visibility : Icons.visibility_off,)),
                            hintText: signInPasswordHint,
                            hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                            contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
                  ],
                ),

                SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextWidget(
                    value: forgetPassword,
                    fontWeight: FontWeight.w600,
                    color: BrandColors.yellow,
                    size: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      height: 50,
                      minWidth: double.maxFinite,
                      color: btnColor,

                      child: Text("Sign In",style: TextStyle(
                        color: btnText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold

                      ),),
                      onPressed: ()
                      {
                       setState(() {
                         if(emailController.text.isEmpty){
                           Utils.flushBarErrorMessage("Enter an email or username", context);
                         }else if(passwordController.text.isEmpty){
                           Utils.flushBarErrorMessage("Enter password", context);
                         }else if (passwordController.text.length<6){
                           Utils.flushBarErrorMessage("Password length must be 6 digit", context);
                         }
                         else{
                           Get.toNamed(home);
                         }
                       });

                      }

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                color: BrandColors.colorTextBlue,
                                offset: Offset(0, -5))
                          ],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.transparent,
                          decoration:
                          TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,


                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(signup);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                  color: BrandColors.yellow,
                                  offset: Offset(0, -5))
                            ],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.transparent,



                          ),
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),

          ],

        ),

      ),
    );
  }
}






