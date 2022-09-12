class Cart{
   final int? courseId;
  final String? courseName;
  final String? courseInstructor;
  final String? coursePrice;
  final String? courseImage;

   Cart({this.courseId,
      this.courseName,
      this.courseInstructor,
      this.coursePrice,
      this.courseImage});

   Cart.fromMap(Map<dynamic,dynamic> res)
        :courseId=res['courseId'],
         courseName=res['courseName'],
         courseInstructor=res['courseInstructor'],
         coursePrice=res['coursePrice'],
         courseImage=res['courseImage'];

   Map<String,Object?> toMap(){
     return{
       'courseId':courseId,
       'courseName':courseName,
       'courseInstructor':courseInstructor,
       'coursePrice':coursePrice,
       'courseImage':courseImage,
     };
   }


}