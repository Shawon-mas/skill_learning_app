import 'package:flutter/material.dart';
import 'package:vcourse/screen/allcourse_screen.dart';
import 'package:vcourse/widget/all_courses.dart';
import 'package:vcourse/widget/primary_toolbar.dart';
class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolbar(value: "Courses"),
      body: AllCourse(),
    );
  }
}
