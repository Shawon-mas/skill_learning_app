import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/routes/routes.dart';
import 'package:vcourse/screen/discover_screen.dart';
import 'package:vcourse/screen/test.dart';
import 'package:vcourse/utilites/preferences_manager.dart';
import 'package:vcourse/widget/brand_color.dart';

import 'introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PreferenceManager preferenceManager=PreferenceManager();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetointroduction();
  }
  _navigatetointroduction() async{


      await Future.delayed(Duration(milliseconds: 2500),(){});
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TestFile()));
      Get.offNamed(introduction);

      /*FutureBuilder<bool?>(
        future: preferenceManager.getBoolean("shawon"),
        builder: (context,snap){
          if(snap.data==false){
             Future.delayed(Duration(milliseconds: 2500),(){});
            return IntroductionScreen();
          }else{
            return DiscoverScreen();
          }

        },
      );*/


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: BrandColors.lightYellow,
            ),
          ),
          Center(
            child:
            Container(
              child:
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(splashImage,height: 70.h,width: 150.w,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

