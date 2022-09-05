import 'dart:ffi';

import 'package:flutter/material.dart';
class Instructor extends StatefulWidget {
  final String value;
  final int number;
  const Instructor({Key? key, required this.value, required this.number}) : super(key: key);

  @override
  State<Instructor> createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.value);
  }
}
