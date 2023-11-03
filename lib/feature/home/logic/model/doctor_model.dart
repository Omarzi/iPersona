class DoctorModel {
  bool? status;
  String? msg;
  Data? data;

  DoctorModel({this.status, this.msg, this.data});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<DoctorModelDate>? doctorOffline;
  List<DoctorModelDate>? doctorOnline;

  Data({this.doctorOffline, this.doctorOnline});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctor_offline'] != null) {
      doctorOffline = <DoctorModelDate>[];
      json['doctor_offline'].forEach((v) {
        doctorOffline!.add(new DoctorModelDate.fromJson(v));
      });
    }
    if (json['doctor_online'] != null) {
      doctorOnline = <DoctorModelDate>[];
      json['doctor_online'].forEach((v) {
        doctorOnline!.add(new DoctorModelDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctorOffline != null) {
      data['doctor_offline'] =
          this.doctorOffline!.map((v) => v.toJson()).toList();
    }
    if (this.doctorOnline != null) {
      data['doctor_online'] =
          this.doctorOnline!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorModelDate {
  int? id;
  String? name;
  String? image;
  Information? information;
  List<DoctorRatings>? doctorRatings;

  DoctorModelDate(
      {this.id, this.name, this.image, this.information, this.doctorRatings});

  DoctorModelDate.fromJson(Map<String, dynamic> json) {
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

  Information({this.userId, this.jobTitle});

  Information.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['job_title'] = this.jobTitle;
    return data;
  }
}

class DoctorRatings {
  int? userId;
  double? rating;

  DoctorRatings({this.userId, this.rating});

  DoctorRatings.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['rating'] = rating;
    return data;
  }
}
