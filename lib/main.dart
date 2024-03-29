import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vcourse/cousemodule/courseCart/cart_provider/cart_provider.dart';

import 'package:vcourse/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> CartProvider(),
      child: ScreenUtilInit(
        designSize: const Size(360,800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            initialRoute: splash,
            debugShowCheckedModeBanner: false,
            getPages: pages,
            // home: SplashScreen(),
          );
        },
      )
    );
  }
}
//
// debugShowCheckedModeBanner: false,
// home: SplashScreen(),
/*

    );
ScreenUtilInit(
      designSize: const Size(360,800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          initialRoute: splash,
          debugShowCheckedModeBanner: false,
          getPages: pages,
         // home: SplashScreen(),
        );
      },
    )
 */
