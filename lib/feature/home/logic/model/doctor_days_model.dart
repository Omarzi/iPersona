class DoctorDayesModel {
  bool? status;
  String? msg;
  List<DoctorDayesModelData>? data;

  DoctorDayesModel({this.status, this.msg, this.data});

  DoctorDayesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DoctorDayesModelData>[];
      json['data'].forEach((v) {
        data!.add(new DoctorDayesModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorDayesModelData {
  String? date;

  DoctorDayesModelData({this.date});

  DoctorDayesModelData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    return data;
  }
}
