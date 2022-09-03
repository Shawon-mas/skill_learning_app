import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcourse/constants/image_strings.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';
import 'package:vcourse/models/courses.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class TestFile extends StatefulWidget {
  const TestFile({Key? key}) : super(key: key);


  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  Future<CourseModel> getCourseApi() async{
    var link='https://vcourse.net/api/courses';
    final response= await http.get(Uri.parse(link));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print("Respnse:${data}");
      return CourseModel.fromJson(data);
    }else{
      return CourseModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(children: [
      Expanded(
          child: FutureBuilder<CourseModel>(
            future:getCourseApi() ,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context,index){
                    var dataCourse =snapshot.data!.data![index];
                      return Column(
                        children: [

                          Text(dataCourse.name!.toString()),
                          Text('https://vcourse.net/${dataCourse.user!.profilePicture!.toString()}'),
                          ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Image.network('https://vcourse.net/${dataCourse.thumbnail!.toString()}',
                                  fit: BoxFit.cover,
                                  height: 60.0, width: 160.0))

                        ],
                      );
                    }
                );
              }else{
                return Text("loadin");
              }

            },

      )
      )
    ],),

    );

  }
}
/*
Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("shawon"),
                      Text("shawon"),
                      Text("shawon"),
                    ],
                  )
 */