import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/models/courses.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class TestFile extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool? looping;

  const TestFile({Key? key, required this.videoPlayerController, this.looping}) : super(key: key);


  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController=ChewieController(videoPlayerController: widget.videoPlayerController,
     aspectRatio: 16/9,
      autoInitialize: false,
      looping: false,
      autoPlay: true,
      errorBuilder: (context,errormessage){
      return Center(
          child: Text(errormessage,style: TextStyle(color: Colors.white),),
      );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
