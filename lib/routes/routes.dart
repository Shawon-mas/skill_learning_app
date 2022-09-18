import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vcourse/screen/allcourse_screen.dart';
import 'package:vcourse/screen/cart_screen.dart';
import 'package:vcourse/screen/discover_screen.dart';
import 'package:vcourse/screen/drawerScreen/homepage_screen.dart';

import 'package:vcourse/screen/introduction_screen.dart';
import 'package:vcourse/screen/signin_screen.dart';
import 'package:vcourse/screen/signup_screen.dart';
import 'package:vcourse/screen/splash_screen.dart';

const splash = "/";
const introduction = "/introduction";
const discover = "/discover";
const signin = "/signin";
const signup = "/signup";
const cartScreen= "/cartScreen";
const allcourse= "/AllCourseScreen";
const home= "/homeScreen";

final pages = [
  page(splash, SplashScreen(),),
  page(introduction, IntroductionScreen(),),
  page(discover, DiscoverScreen(),),
  page(signin, SignInScreen(),),
  page(signup, SignUpScreen(),),
  page(cartScreen, CartScreen(),),
  page(allcourse, AllCourseScreen(),),
  page(home, HomePage(),),

];
GetPage page(String name, Widget page) {
  return GetPage(name: name, page: () => page);
}