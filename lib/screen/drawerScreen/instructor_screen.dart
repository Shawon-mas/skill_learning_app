import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcourse/widget/intructor_list.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
class InstructorScreen extends StatefulWidget {
  const InstructorScreen({Key? key}) : super(key: key);

  @override
  State<InstructorScreen> createState() => _InstructorScreenState();
}

class _InstructorScreenState extends State<InstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar(value: "Instructor"),

      body: Column(
        children: [
          SizedBox(height: 20.h,),
          InstructorList(),
        ],
      ),
    );
  }
}
