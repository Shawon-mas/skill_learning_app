import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apimodule/api_services.dart';
import '../cousemodule/models/CourseDetailsModel.dart';
import '../cousemodule/models/CourseModel.dart';
import 'package:http/http.dart' as http;

class CourseController extends GetxController{
  var courseList=<CourseModel>[].obs;
  var courseDetailsList=<CourseDetailsModel>[].obs;
  var isLoading=false.obs;
  var courseId='10'.obs;

     void fetchCourses() async{
        try{
          var courses=await ApiServices.fetchCourses();
          isLoading.value=true;
          courseList.assignAll(courses);
        }finally{

        }
      //  courseList.value=courses;
   /* var response=await ApiServices.client.get(Uri.parse(ApiServices.coursesLink));
    if(response.statusCode==200){

      var result=courseModelFromJson(response.body);
      debugPrint("Response:${result.data}");
      courseList.value=result.data!;
    }else{
      throw Exception('Failed to load data') ;
    }
*/

  }
  fetchCoursesDetails() async{
    // var courses=await ApiServices.fetchCourses();
    //  courseList.value=courses;
    var response=await ApiServices.client.get(Uri.parse('https://vcourse.net/api/courses/17/show'));
    if(response.statusCode==200){
      isLoading.value=true;
      var result=courseDetailsModelFromJson(response.body);
      debugPrint("Response:${result.data!.id}");

    }else{
      throw Exception('Failed to load data') ;
    }


  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCourses();
    fetchCoursesDetails();
    if(courseId.value.isEmpty){

    }
  }

}