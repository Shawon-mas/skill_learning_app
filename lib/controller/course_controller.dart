import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apimodule/api_services.dart';
import '../cousemodule/models/CourseModel.dart';
import 'package:http/http.dart' as http;

class CourseController extends GetxController{
  var courseList=<Datum>[].obs;
  var isLoading=false.obs;

   fetchCourses() async{
       // var courses=await ApiServices.fetchCourses();
      //  courseList.value=courses;
    var response=await ApiServices.client.get(Uri.parse(ApiServices.link));
    if(response.statusCode==200){
      isLoading.value=true;
      var result=courseModelFromJson(response.body);
      debugPrint("Response:${result.data}");
      courseList.value=result.data!;
    }else{
      throw Exception('Failed to load data') ;
    }


  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCourses();
  }

}