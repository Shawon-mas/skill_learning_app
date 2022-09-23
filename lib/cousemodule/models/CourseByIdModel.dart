class course_model_byId {
  int? status;
  String? message;
  Data? data;

  course_model_byId({this.status, this.message, this.data});

  course_model_byId.fromJson(Map<String, dynamic> json) {
    status = json['status '];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status '] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? thumbnail;
  int? userId;
  int? categoryId;
  String? price;
  String? oldPrice;
  String? status;
  String? timeDuration;
  Null? mediaLink;
  String? ratingNumber;
  String? ratingQuantity;
  int? numberOfLessons;
  Null? studentEnrolled;
  int? discount;
  String? timing;
  String? venu;
  String? description;
  String? requirments;
  String? forwho;
  String? whatWillLearn;
  String? createdAt;
  String? updatedAt;
  User? user;
  Category? category;
  List<Lessons>? lessons;
  List<NextBatch>? nextBatch;
  List<EnrollItems>? enrollItems;

  Data(
      {this.id,
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
        this.enrollItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    price = json['price'];
    oldPrice = json['old_price'];
    status = json['status'];
    timeDuration = json['time_duration'];
    mediaLink = json['media_link'];
    ratingNumber = json['rating_number'];
    ratingQuantity = json['rating_quantity'];
    numberOfLessons = json['number_of_lessons'];
    studentEnrolled = json['student_enrolled'];
    discount = json['discount'];
    timing = json['timing'];
    venu = json['venu'];
    description = json['description'];
    requirments = json['requirments'];
    forwho = json['forwho'];
    whatWillLearn = json['what_will_learn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
    if (json['next_batch'] != null) {
      nextBatch = <NextBatch>[];
      json['next_batch'].forEach((v) {
        nextBatch!.add(new NextBatch.fromJson(v));
      });
    }
    if (json['enroll_items'] != null) {
      enrollItems = <EnrollItems>[];
      json['enroll_items'].forEach((v) {
        enrollItems!.add(new EnrollItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['status'] = this.status;
    data['time_duration'] = this.timeDuration;
    data['media_link'] = this.mediaLink;
    data['rating_number'] = this.ratingNumber;
    data['rating_quantity'] = this.ratingQuantity;
    data['number_of_lessons'] = this.numberOfLessons;
    data['student_enrolled'] = this.studentEnrolled;
    data['discount'] = this.discount;
    data['timing'] = this.timing;
    data['venu'] = this.venu;
    data['description'] = this.description;
    data['requirments'] = this.requirments;
    data['forwho'] = this.forwho;
    data['what_will_learn'] = this.whatWillLearn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    if (this.nextBatch != null) {
      data['next_batch'] = this.nextBatch!.map((v) => v.toJson()).toList();
    }
    if (this.enrollItems != null) {
      data['enroll_items'] = this.enrollItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phoneNumber;
  String? profilePicture;
  Null? slug;
  Null? affiliateLink;
  String? facebook;
  String? linkedin;
  int? applied;
  Null? designation;
  String? experties;
  String? aboutMe;
  String? cv;
  Null? note;
  Null? userId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? fbId;
  Null? googleId;

  User(
      {this.id,
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
        this.googleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    profilePicture = json['profile_picture'];
    slug = json['slug'];
    affiliateLink = json['affiliate_link'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    applied = json['applied'];
    designation = json['designation'];
    experties = json['experties'];
    aboutMe = json['about_me'];
    cv = json['cv'];
    note = json['note'];
    userId = json['user_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fbId = json['fb_id'];
    googleId = json['google_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    data['profile_picture'] = this.profilePicture;
    data['slug'] = this.slug;
    data['affiliate_link'] = this.affiliateLink;
    data['facebook'] = this.facebook;
    data['linkedin'] = this.linkedin;
    data['applied'] = this.applied;
    data['designation'] = this.designation;
    data['experties'] = this.experties;
    data['about_me'] = this.aboutMe;
    data['cv'] = this.cv;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fb_id'] = this.fbId;
    data['google_id'] = this.googleId;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  Null? icon;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.icon, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Lessons {
  int? id;
  int? courseId;
  int? batchId;
  int? userId;
  String? name;
  int? number;
  String? mediaLink;
  String? thumbnail;
  String? description;
  String? note;
  String? createdAt;
  String? updatedAt;

  Lessons(
      {this.id,
        this.courseId,
        this.batchId,
        this.userId,
        this.name,
        this.number,
        this.mediaLink,
        this.thumbnail,
        this.description,
        this.note,
        this.createdAt,
        this.updatedAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    batchId = json['batch_id'];
    userId = json['user_id'];
    name = json['name'];
    number = json['number'];
    mediaLink = json['media_link'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['batch_id'] = this.batchId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['number'] = this.number;
    data['media_link'] = this.mediaLink;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class NextBatch {
  int? id;
  String? name;
  int? number;
  int? maxSeat;
  int? enrolledStudents;
  String? lastEnnrollmentDate;
  String? classStartingDate;
  int? courseId;
  String? status;
  String? createdAt;
  String? updatedAt;

  NextBatch(
      {this.id,
        this.name,
        this.number,
        this.maxSeat,
        this.enrolledStudents,
        this.lastEnnrollmentDate,
        this.classStartingDate,
        this.courseId,
        this.status,
        this.createdAt,
        this.updatedAt});

  NextBatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    maxSeat = json['max_seat'];
    enrolledStudents = json['enrolled_students'];
    lastEnnrollmentDate = json['last_ennrollment_date'];
    classStartingDate = json['class_starting_date'];
    courseId = json['course_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['max_seat'] = this.maxSeat;
    data['enrolled_students'] = this.enrolledStudents;
    data['last_ennrollment_date'] = this.lastEnnrollmentDate;
    data['class_starting_date'] = this.classStartingDate;
    data['course_id'] = this.courseId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class EnrollItems {
  int? id;
  int? enrollmentId;
  int? courseId;
  int? batchId;
  int? studentId;
  int? quantity;
  String? price;
  String? createdAt;
  String? updatedAt;

  EnrollItems(
      {this.id,
        this.enrollmentId,
        this.courseId,
        this.batchId,
        this.studentId,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt});

  EnrollItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enrollmentId = json['enrollment_id'];
    courseId = json['course_id'];
    batchId = json['batch_id'];
    studentId = json['student_id'];
    quantity = json['quantity'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enrollment_id'] = this.enrollmentId;
    data['course_id'] = this.courseId;
    data['batch_id'] = this.batchId;
    data['student_id'] = this.studentId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
