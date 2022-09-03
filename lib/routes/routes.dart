import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vcourse/screen/discover_screen.dart';
import 'package:vcourse/screen/introduction_screen.dart';
import 'package:vcourse/screen/splash_screen.dart';

const splash = "/";
const introduction = "/introduction";
const discover = "/discover";
const signup = "/signup";

final pages = [
  page(splash, SplashScreen(),),
  page(introduction, IntroductionScreen(),),
  page(discover, DiscoverScreen(),),

];
GetPage page(String name, Widget page) {
  return GetPage(name: name, page: () => page);
}