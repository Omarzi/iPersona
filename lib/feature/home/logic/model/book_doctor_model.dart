class BookDoctorModel {
  bool? status;
  String? msg;
  String? type;
  List<BookDoctorOnlineDate>? data;

  BookDoctorModel({this.status, this.msg, this.type, this.data});

  BookDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <BookDoctorOnlineDate>[];
      json['data'].forEach((v) {
        data!.add(new BookDoctorOnlineDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookDoctorOnlineDate {
  int? paymentId;
  String? nameEn;
  String? nameAr;
  String? redirect;
  String? logo;

  BookDoctorOnlineDate({this.paymentId, this.nameEn, this.nameAr, this.redirect, this.logo});

  BookDoctorOnlineDate.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    redirect = json['redirect'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentId'] = this.paymentId;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['redirect'] = this.redirect;
    data['logo'] = this.logo;
    return data;
  }
}
