
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/cousemodule/models/CourseByIdModel.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';

  class ApiServices{

   Future<CourseModel> getCourseApi() async{
    var link=baseurl+'courses';
    final response= await http.get(Uri.parse(link));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){

      debugPrint("Respnse:$data");
      return CourseModel.fromJson(data);
    }else{
      return CourseModel.fromJson(data);
    }
  }
   Future<course_model_byId> getCourseApiById(int category_id) async{
     var link='https://vcourse.net/api/${category_id}/show';
     final response= await http.get(Uri.parse(link));
     var data=jsonDecode(response.body.toString());
     if(response.statusCode==200){

       debugPrint("Respnse:$data");
       return course_model_byId.fromJson(data);
     }else{
       return course_model_byId.fromJson(data);
     }
   }

}