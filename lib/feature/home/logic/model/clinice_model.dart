class CliniceModel {
  bool? status;
  String? msg;
  List<CliniceModelData>? data;

  CliniceModel({this.status, this.msg, this.data});

  CliniceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CliniceModelData>[];
      json['data'].forEach((v) {
        data!.add(new CliniceModelData.fromJson(v));
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

class CliniceModelData {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? doctorId;
  String? nameEn;
  String? nameAr;
  String? city;
  String? area;
  String? locationEn;
  String? locationAr;
  int? isShow;

  CliniceModelData(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.doctorId,
      this.nameEn,
      this.nameAr,
      this.city,
      this.area,
      this.locationEn,
      this.locationAr,
      this.isShow});

  CliniceModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctorId = json['doctor_id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    city = json['city'];
    area = json['area'];
    locationEn = json['location_en'];
    locationAr = json['location_ar'];
    isShow = json['is_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['doctor_id'] = this.doctorId;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['city'] = this.city;
    data['area'] = this.area;
    data['location_en'] = this.locationEn;
    data['location_ar'] = this.locationAr;
    data['is_show'] = this.isShow;
    return data;
  }
}
