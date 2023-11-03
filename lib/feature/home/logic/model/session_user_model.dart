class SessionUserModel {
  bool? status;
  String? msg;
  List<SessionUserModelData>? data;

  SessionUserModel({this.status, this.msg, this.data});

  SessionUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <SessionUserModelData>[];
      json['data'].forEach((v) {
        data!.add(SessionUserModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionUserModelData {
  int? doctorId;
  int? patientId;
  String? from;
  String? startUrl;
  int? scheduleId;
  Doctor? doctor;
  Schedule? schedule;

  SessionUserModelData(
      {this.doctorId,
      this.patientId,
      this.from,
      this.startUrl,
      this.scheduleId,
      this.doctor,
      this.schedule});

  SessionUserModelData.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    from = json['from'];
    startUrl = json['join_url'];
    scheduleId = json['schedule_id'];
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['from'] = from;
    data['join_url'] = startUrl;
    data['schedule_id'] = scheduleId;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  String? nameAr;

  Doctor({this.id, this.name, this.nameAr});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    return data;
  }
}

class Schedule {
  int? id;
  String? scheduleType;
  String? date;

  Schedule({this.id, this.scheduleType, this.date});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduleType = json['schedule_type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['schedule_type'] = scheduleType;
    data['date'] = scheduleType;
    return data;
  }
}
