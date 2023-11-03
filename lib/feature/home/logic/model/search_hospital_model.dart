class SearchedHospitalModel {
  bool? status;
  String? msg;
  List<OneHospitalInSearched>? data;
  List<HospitalCities>? cities;

  SearchedHospitalModel({this.status, this.msg, this.data, this.cities});

  SearchedHospitalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <OneHospitalInSearched>[];
      json['data'].forEach((v) {
        data!.add(new OneHospitalInSearched.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <HospitalCities>[];
      json['cities'].forEach((v) {
        cities!.add(new HospitalCities.fromJson(v));
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
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneHospitalInSearched {
  int? id;
  String? name;
  int? myPrice;
  String? image;

  OneHospitalInSearched({this.id, this.name, this.myPrice,this.image});

  OneHospitalInSearched.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    myPrice = json['my_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['my_price'] = myPrice;
    data['image'] = image;
    return data;
  }
}

class HospitalCities {
  int? id;
  String? nameAr;
  String? nameEn;

  HospitalCities({this.id, this.nameAr, this.nameEn});

  HospitalCities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}
