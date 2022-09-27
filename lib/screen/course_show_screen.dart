import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcourse/apimodule/api_services.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/cousemodule/courseCart/cart_model.dart';
import 'package:vcourse/cousemodule/courseCart/cart_provider/cart_provider.dart';
import 'package:vcourse/cousemodule/courseCart/database/db_helper.dart';
import 'package:vcourse/cousemodule/models/CourseDetailsModel.dart';
import 'package:http/http.dart' as http;
import 'package:vcourse/screen/cart_screen.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/custom_button.dart';
import 'package:vcourse/widget/primary_button.dart';
import 'package:vcourse/widget/text_widget.dart';

class CourseShowScreen extends StatefulWidget {
  final int courseId;
  const CourseShowScreen({Key? key, required this.courseId}) : super(key: key);

  @override
  State<CourseShowScreen> createState() => _CourseShowScreenState();
}

class _CourseShowScreenState extends State<CourseShowScreen> {
  DBHelper dbHelper = DBHelper();
  bool isLogging = true;
  late ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    apiServices.getCourseApiById(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    ApiServices apiServices = ApiServices();
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: BrandColors.colorTextBlue,
            )),
        title: Text(
          'Course Details',
          style: GoogleFonts.nunito(
              color: BrandColors.colorTextBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        actions: [

          InkWell(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
          child: Center(
            child: Badge(
              badgeContent: Consumer<CartProvider>(builder: (context,value,child){
              return Text(
                 value.getCounter().toString(), style: GoogleFonts.nunito(
                    color: BrandColors.colorWhite, fontSize: 12.sp),
                );
              }),
              child: Icon(Icons.shopping_cart, color: BrandColors.colorTextBlue),
            ),
          ),
        ),
          SizedBox(
            width: 20.w,
          )
        ],


      ),
      body: FutureBuilder<CourseDetailsModel>(
        future: apiServices.getCourseApiById(12),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }else{
            return Text(snapshot.data!.data!.name.toString());
          }
        },
      ),
    );
  }
}
