import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/screen/discover_screen.dart';

import '../widget/custom_button.dart';
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         children: [
            Container(
              decoration: BoxDecoration(
                color: BrandColors.lightYellow
              ),
            ),
            Container(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Padding(
                   padding: const EdgeInsets.fromLTRB(16,100,0,0),
                   child: Image.asset('assets/images/splash_logo.png'),
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10,0,0,0),
                   child: Text("Develop Skills With Expert on Live!",
                     style: GoogleFonts.nunito(
                       textStyle: TextStyle(
                              color: BrandColors.colorText,
                         fontSize: 25.sp,
                         fontWeight: FontWeight.w700,
                         letterSpacing: -0.5,
                       )
                     ),

                   ),
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10,0,0,0),
                   child: Text("Our goal is to construct skills and transform Bangladesh's unemployment crisis into competent manpower for the digital economy.",
                     style: GoogleFonts.nunito(
                         textStyle: TextStyle(
                           color: BrandColors.colorText,
                           fontSize: 18.sp,
                           fontWeight: FontWeight.w500,
                           letterSpacing: -0.5,
                         )
                     ),

                   ),
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     decoration: BoxDecoration(
                       boxShadow: const [
                         BoxShadow(

                           color: Colors.black26,
                           blurRadius: 2,
                           offset: Offset(1, 1)
                         )
                       ]
                     ),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                         filled: true,
                          fillColor: Colors.white,
                           prefixIcon: Icon(
                               Icons.search,
                             color: BrandColors.colorPrimary
                           ),
                           hintText: "Search",
                           hintStyle: TextStyle(fontSize: 18.sp, color: BrandColors.colorText),
                           contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(5),
                               borderSide: BorderSide(color: Colors.white)
                           ),
                           enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(5),
                               borderSide: BorderSide(color: Colors.white)
                           ),
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(5),
                               borderSide: BorderSide(color: Colors.white)
                           )
                       ),

                     ),
                   ),
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>DiscoverScreen()));

                     },
                     child: Text(
                       "Explore all our courses",
                       style: GoogleFonts.nunito(
                         textStyle: TextStyle(
                           color: BrandColors.colorText,
                           fontSize: 18.sp,

                         ),
                         shadows: [
                           Shadow(
                               color: Colors.black,
                               offset: Offset(0, -5))
                         ],
                         color: Colors.transparent,
                         decoration:
                         TextDecoration.underline,
                         decorationColor: Colors.black,
                         decorationThickness: 2,

                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 10),

               ],
             ),
           ),
            Padding(
             padding: const EdgeInsets.only(bottom: 40.0),
             child: Align(
               alignment: Alignment.bottomCenter,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible(
                     flex: 2,
                     fit: FlexFit.tight,
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                       child: CustomButton(
                         value: "Sign Up",
                         buttonColor: BrandColors.colorPrimary,onPressed: (){

                       },),
                     ),
                   ),
                   Flexible(
                     flex: 1,
                     fit: FlexFit.tight,
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                       child: CustomButton(
                         value: "Sign In",
                         buttonColor: BrandColors.yellow,onPressed: (){

                       },),
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),

    );
  }
}
