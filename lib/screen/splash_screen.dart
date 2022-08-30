import 'package:flutter/material.dart';
import 'package:vcourse/screen/discover_screen.dart';
import 'package:vcourse/widget/brand_color.dart';

import 'introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetointroduction();
  }
  _navigatetointroduction() async{
    await Future.delayed(Duration(milliseconds: 2500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DiscoverScreen()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFFCEA),
            ),
          ),
          Center(
            child:
            Container(
              child:
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset('assets/images/splash_logo.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

