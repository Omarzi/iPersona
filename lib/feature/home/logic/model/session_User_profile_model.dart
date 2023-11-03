class SessionUserProfileModel {
  bool? status;
  String? msg;
  SessionUserProfileModelData? data;
  String? statusAppointment;
  Schedule? schedule;

  SessionUserProfileModel(
      {this.status,
      this.msg,
      this.data,
      this.statusAppointment,
      this.schedule});

  SessionUserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new SessionUserProfileModelData.fromJson(json['data']) : null;
    statusAppointment = json['status_appointment'];
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_appointment'] = this.statusAppointment;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    return data;
  }
}

class SessionUserProfileModelData {
  int? id;
  String? name;
  String? image;
  Information? information;
  List<DoctorRatings>? doctorRatings;

  SessionUserProfileModelData({this.id, this.name, this.image, this.information, this.doctorRatings});

  SessionUserProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
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
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    if (this.doctorRatings != null) {
      data['doctor_ratings'] =
          this.doctorRatings!.map((v) => v.toJson()).toList();
    }
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

class DoctorRatings {
  int? userId;
  int? rating;

  DoctorRatings({this.userId, this.rating});

  DoctorRatings.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    return data;
  }
}

class Schedule {
  int? id;
  String? date;
  String? from;
  String? to;
  String? scheduleType;
  int? sessionPrice;

  Schedule(
      {this.id,
      this.date,
      this.from,
      this.to,
      this.scheduleType,
      this.sessionPrice});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    from = json['from'];
    to = json['to'];
    scheduleType = json['schedule_type'];
    sessionPrice = json['session_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['from'] = this.from;
    data['to'] = this.to;
    data['schedule_type'] = this.scheduleType;
    data['session_price'] = this.sessionPrice;
    return data;
  }
}
