// To parse this JSON data, do
//
//     final courseDetailsModel = courseDetailsModelFromJson(jsonString);

import 'dart:convert';

CourseDetailsModel courseDetailsModelFromJson(String str) => CourseDetailsModel.fromJson(json.decode(str));

String courseDetailsModelToJson(CourseDetailsModel data) => json.encode(data.toJson());

class CourseDetailsModel {
  CourseDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) => CourseDetailsModel(
    status: json["status "],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status ": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.thumbnail,
    this.userId,
    this.categoryId,
    this.price,
    this.oldPrice,
    this.status,
    this.timeDuration,
    this.mediaLink,
    this.ratingNumber,
    this.ratingQuantity,
    this.numberOfLessons,
    this.studentEnrolled,
    this.discount,
    this.timing,
    this.venu,
    this.description,
    this.requirments,
    this.forwho,
    this.whatWillLearn,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.category,
    this.lessons,
    this.nextBatch,
    this.enrollItems,
  });

  int? id;
  String? name;
  String? thumbnail;
  int? userId;
  int? categoryId;
  String? price;
  String? oldPrice;
  String? status;
  String? timeDuration;
  String? mediaLink;
  String? ratingNumber;
  String? ratingQuantity;
  int? numberOfLessons;
  dynamic studentEnrolled;
  int? discount;
  String? timing;
  String? venu;
  String? description;
  String? requirments;
  String? forwho;
  String? whatWillLearn;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Category? category;
  List<dynamic>? lessons;
  List<NextBatch>? nextBatch;
  List<EnrollItem>? enrollItems;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    thumbnail: json["thumbnail"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    price: json["price"],
    oldPrice: json["old_price"],
    status: json["status"],
    timeDuration: json["time_duration"],
    mediaLink: json["media_link"],
    ratingNumber: json["rating_number"],
    ratingQuantity: json["rating_quantity"],
    numberOfLessons: json["number_of_lessons"],
    studentEnrolled: json["student_enrolled"],
    discount: json["discount"],
    timing: json["timing"],
    venu: json["venu"],
    description: json["description"],
    requirments: json["requirments"],
    forwho: json["forwho"],
    whatWillLearn: json["what_will_learn"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
    category: Category.fromJson(json["category"]),
    lessons: List<dynamic>.from(json["lessons"].map((x) => x)),
    nextBatch: List<NextBatch>.from(json["next_batch"].map((x) => NextBatch.fromJson(x))),
    enrollItems: List<EnrollItem>.from(json["enroll_items"].map((x) => EnrollItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail": thumbnail,
    "user_id": userId,
    "category_id": categoryId,
    "price": price,
    "old_price": oldPrice,
    "status": status,
    "time_duration": timeDuration,
    "media_link": mediaLink,
    "rating_number": ratingNumber,
    "rating_quantity": ratingQuantity,
    "number_of_lessons": numberOfLessons,
    "student_enrolled": studentEnrolled,
    "discount": discount,
    "timing": timing,
    "venu": venu,
    "description": description,
    "requirments": requirments,
    "forwho": forwho,
    "what_will_learn": whatWillLearn,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "user": user!.toJson(),
    "category": category!.toJson(),
    "lessons": List<dynamic>.from(lessons!.map((x) => x)),
    "next_batch": List<dynamic>.from(nextBatch!.map((x) => x.toJson())),
    "enroll_items": List<dynamic>.from(enrollItems!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class EnrollItem {
  EnrollItem({
    this.id,
    this.enrollmentId,
    this.courseId,
    this.batchId,
    this.studentId,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? enrollmentId;
  int? courseId;
  int? batchId;
  int? studentId;
  int? quantity;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory EnrollItem.fromJson(Map<String, dynamic> json) => EnrollItem(
    id: json["id"],
    enrollmentId: json["enrollment_id"],
    courseId: json["course_id"],
    batchId: json["batch_id"],
    studentId: json["student_id"],
    quantity: json["quantity"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "enrollment_id": enrollmentId,
    "course_id": courseId,
    "batch_id": batchId,
    "student_id": studentId,
    "quantity": quantity,
    "price": price,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class NextBatch {
  NextBatch({
    this.id,
    this.name,
    this.number,
    this.maxSeat,
    this.enrolledStudents,
    this.lastEnnrollmentDate,
    this.classStartingDate,
    this.courseId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? number;
  int? maxSeat;
  int? enrolledStudents;
  DateTime? lastEnnrollmentDate;
  DateTime? classStartingDate;
  int? courseId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NextBatch.fromJson(Map<String, dynamic> json) => NextBatch(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    maxSeat: json["max_seat"],
    enrolledStudents: json["enrolled_students"],
    lastEnnrollmentDate: DateTime.parse(json["last_ennrollment_date"]),
    classStartingDate: DateTime.parse(json["class_starting_date"]),
    courseId: json["course_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "max_seat": maxSeat,
    "enrolled_students": enrolledStudents,
    "last_ennrollment_date": "${lastEnnrollmentDate!.year.toString().padLeft(4, '0')}-${lastEnnrollmentDate!.month.toString().padLeft(2, '0')}-${lastEnnrollmentDate!.day.toString().padLeft(2, '0')}",
    "class_starting_date": "${classStartingDate!.year.toString().padLeft(4, '0')}-${classStartingDate!.month.toString().padLeft(2, '0')}-${classStartingDate!.day.toString().padLeft(2, '0')}",
    "course_id": courseId,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phoneNumber,
    this.profilePicture,
    this.slug,
    this.affiliateLink,
    this.facebook,
    this.linkedin,
    this.applied,
    this.designation,
    this.experties,
    this.aboutMe,
    this.cv,
    this.note,
    this.userId,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.fbId,
    this.googleId,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? phoneNumber;
  String? profilePicture;
  dynamic slug;
  dynamic affiliateLink;
  String? facebook;
  String? linkedin;
  int? applied;
  dynamic designation;
  String? experties;
  String? aboutMe;
  String? cv;
  dynamic note;
  dynamic userId;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic fbId;
  dynamic googleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    username: json["username"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
    slug: json["slug"],
    affiliateLink: json["affiliate_link"],
    facebook: json["facebook"],
    linkedin: json["linkedin"],
    applied: json["applied"],
    designation: json["designation"],
    experties: json["experties"],
    aboutMe: json["about_me"],
    cv: json["cv"],
    note: json["note"],
    userId: json["user_id"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fbId: json["fb_id"],
    googleId: json["google_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "phone_number": phoneNumber,
    "profile_picture": profilePicture,
    "slug": slug,
    "affiliate_link": affiliateLink,
    "facebook": facebook,
    "linkedin": linkedin,
    "applied": applied,
    "designation": designation,
    "experties": experties,
    "about_me": aboutMe,
    "cv": cv,
    "note": note,
    "user_id": userId,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "fb_id": fbId,
    "google_id": googleId,
  };
}
