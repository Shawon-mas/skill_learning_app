import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/cousemodule/models/CourseDetailsModel.dart';
import 'package:vcourse/cousemodule/models/CourseModel.dart';

  class ApiServices{

    static var client=http.Client();
    static var coursesLink=baseurl+'courses';
    static var coursesDetailsLink=baseurl+'courses';

    static Future<List<CourseModel>> fetchCourses() async{
      var response=await client.get(Uri.parse(coursesLink));
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        debugPrint("Response:$data");
        return courseModelFromJson(data);
      }else{
        throw Exception('Failed to load data') ;
      }


    }

   Future<CourseModel> getCourseApi() async{
    var link=baseurl+'courses';
    final response= await http.get(Uri.parse(link));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      debugPrint("Response:$data");
      return CourseModel.fromJson(data);
    }else{
      throw Exception('Failed to load data');
    }
  }

   Future<CourseDetailsModel> getCourseApiById(int categoryId) async{
     var link=baseurl+'courses/$categoryId/show';
     final response= await http.get(Uri.parse(link));
     if(response.statusCode==200){
       var data=jsonDecode(response.body);
       debugPrint("Response:$data");
       return CourseDetailsModel.fromJson(data);
     }else{
       throw Exception('Failed to load data');

     }
   }

}