

// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  CourseModel({
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
  dynamic? studentEnrolled;
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


  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
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
  dynamic? icon;
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
    emailVerifiedAt: json["email_verified_at"],
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
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "fb_id": fbId,
    "google_id": googleId,
  };
}

















/*


import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    status: json["status "],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status ": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
  dynamic? studentEnrolled;
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    thumbnail: json["thumbnail"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    price: json["price"],
    oldPrice: json["old_price"],
    status: json["status"],
    timeDuration: json["time_duration"],
    mediaLink: json["media_link"] == null ? null : json["media_link"],
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
    "media_link": mediaLink == null ? null : mediaLink,
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
  dynamic? icon;
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
    aboutMe: json["about_me"] == null ? null : json["about_me"],
    cv: json["cv"] == null ? null : json["cv"],
    note: json["note"],
    userId: json["user_id"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
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
    "about_me": aboutMe == null ? null : aboutMe,
    "cv": cv == null ? null : cv,
    "note": note,
    "user_id": userId,
    "email_verified_at": emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "fb_id": fbId,
    "google_id": googleId,
  };
}
*/
