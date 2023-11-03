class DoctorDetailsModel {
  bool? status;
  String? msg;
  DoctorDetailsModelData? data;

  DoctorDetailsModel({this.status, this.msg, this.data});

  DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new DoctorDetailsModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DoctorDetailsModelData {
  int? id;
  String? name;
  String? image;
  String? onlinePrice;
  String? oflinePrice;
  String? zoomEmail;
  String? zoomId;
  Null zoomLink;
  List<Schedules>? schedules;
  Information? information;
  List<Specialities>? specialities;
  List<DoctorRatings>? doctorRatings;

  DoctorDetailsModelData(
      {this.id,
      this.name,
      this.image,
      this.onlinePrice,
      this.oflinePrice,
      this.zoomEmail,
      this.zoomId,
      this.zoomLink,
      this.schedules,
      this.information,
      this.specialities,
      this.doctorRatings});

  DoctorDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    onlinePrice = json['online_price'];
    oflinePrice = json['ofline_price'];
    zoomEmail = json['zoom_email'];
    zoomId = json['zoom_id'];
    zoomLink = json['zoom_link'];
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(new Schedules.fromJson(v));
      });
    }
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
    if (json['specialities'] != null) {
      specialities = <Specialities>[];
      json['specialities'].forEach((v) {
        specialities!.add(new Specialities.fromJson(v));
      });
    }
    if (json['doctor_ratings'] != null) {
      doctorRatings = <DoctorRatings>[];
      json['doctor_ratings'].forEach((v) {
        doctorRatings!.add(new DoctorRatings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['online_price'] = this.onlinePrice;
    data['ofline_price'] = this.oflinePrice;
    data['zoom_email'] = this.zoomEmail;
    data['zoom_id'] = this.zoomId;
    data['zoom_link'] = this.zoomLink;
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    if (this.specialities != null) {
      data['specialities'] = this.specialities!.map((v) => v.toJson()).toList();
    }
    if (this.doctorRatings != null) {
      data['doctor_ratings'] =
          this.doctorRatings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  int? userId;
  String? date;
  String? from;
  String? to;
  String? scheduleType;

  Schedules({this.userId, this.date, this.from, this.to, this.scheduleType});

  Schedules.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    date = json['date'];
    from = json['from'];
    to = json['to'];
    scheduleType = json['schedule_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['from'] = this.from;
    data['to'] = this.to;
    data['schedule_type'] = this.scheduleType;
    return data;
  }
}

class Information {
  int? userId;
  String? jobTitle;
  String? clinic;
  String? about;

  Information({this.userId, this.jobTitle, this.clinic, this.about});

  Information.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    jobTitle = json['job_title'];
    clinic = json['clinic'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['job_title'] = this.jobTitle;
    data['clinic'] = this.clinic;
    data['about'] = this.about;
    return data;
  }
}

class Specialities {
  String? nameSpecialities;
  Pivot? pivot;

  Specialities({this.nameSpecialities, this.pivot});

  Specialities.fromJson(Map<String, dynamic> json) {
    nameSpecialities = json['name_specialities'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_specialities'] = this.nameSpecialities;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? specialityId;

  Pivot({this.userId, this.specialityId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    specialityId = json['speciality_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['speciality_id'] = this.specialityId;
    return data;
  }
}

class DoctorRatings {
  int? userId;
  int? rating;
  String? comment;
  String? name;

  DoctorRatings({this.userId, this.rating, this.comment, this.name});

  DoctorRatings.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    rating = json['rating'];
    comment = json['comment'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['name'] = this.name;
    return data;
  }
}
