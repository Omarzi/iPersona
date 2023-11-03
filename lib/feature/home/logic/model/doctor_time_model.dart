class DoctorTimeModel {
  bool? status;
  String? msg;
  List<DoctorTimeModelData>? data;

  DoctorTimeModel({this.status, this.msg, this.data});

  DoctorTimeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DoctorTimeModelData>[];
      json['data'].forEach((v) {
        data!.add(new DoctorTimeModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorTimeModelData {
  String? to;
  String? from;
  int? id;

  DoctorTimeModelData({this.to, this.from,this.id});

  DoctorTimeModelData.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    from = json['from'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = to;
    data['from'] = from;
    data['id'] = id;
    return data;
  }
}
