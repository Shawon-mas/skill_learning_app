
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vcourse/cousemodule/models/CourseModel.dart';

  class ApiServices{

   Future<CourseModel> getCourseApi() async{
    var link='https://vcourse.net/api/courses';
    final response= await http.get(Uri.parse(link));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      debugPrint("Respnse:$data");
      return CourseModel.fromJson(data);
    }else{
      return CourseModel.fromJson(data);
    }
  }

}