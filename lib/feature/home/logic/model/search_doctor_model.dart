class SearchDoctorModel {
  String? msg;
  bool? status;
  SearchDoctorModelData? data;

  SearchDoctorModel({this.msg, this.status, this.data});

  SearchDoctorModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? SearchDoctorModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SearchDoctorModelData {
  List<Doctors>? doctors;
  List<Specialities>? specialities;
  List<Countries>? countries;
  List<Cities>? cities;
  List<SelectedAreas>? selectedAreas;

  SearchDoctorModelData(
      {this.doctors,
      this.specialities,
      this.countries,
      this.cities,
      this.selectedAreas});

  SearchDoctorModelData.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
    if (json['specialities'] != null) {
      specialities = <Specialities>[];
      json['specialities'].forEach((v) {
        specialities!.add(Specialities.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['selectedAreas'] != null) {
      selectedAreas = <SelectedAreas>[];
      json['selectedAreas'].forEach((v) {
        selectedAreas!.add(new SelectedAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    if (this.specialities != null) {
      data['specialities'] = this.specialities!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.selectedAreas != null) {
      data['selectedAreas'] =
          this.selectedAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  String? name;
  String? image;
  String? onlinePrice;
  String? oflinePrice;
  DoctorInformation? information;
  List<DoctorRatings>? doctorRatings;

  Doctors(
      {this.id,
      this.name,
      this.image,
      this.onlinePrice,
      this.oflinePrice,
      this.information,
      this.doctorRatings});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    onlinePrice = json['online_price'];
    oflinePrice = json['ofline_price'];
    information = json['information'] != null
        ? new DoctorInformation.fromJson(json['information'])
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
    data['online_price'] = this.onlinePrice;
    data['ofline_price'] = this.oflinePrice;
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

class DoctorRatings {
  int? userId;
  dynamic rating;

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
class DoctorInformation {
  int? userId;
  String? jobTitle;

  DoctorInformation({this.userId, this.jobTitle});

  DoctorInformation.fromJson(Map<String, dynamic> json) {
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

class Schedules {
  int? id;
  int? userId;
  String? date;
  String? from;
  String? to;
  int? interval;
  int? sessionPrice;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? scheduleType;
  String? intervalType;
  int? sessionPriceOutside;
  int? clinicId;
  int? isShow;

  Schedules(
      {this.id,
      this.userId,
      this.date,
      this.from,
      this.to,
      this.interval,
      this.sessionPrice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.scheduleType,
      this.intervalType,
      this.sessionPriceOutside,
      this.clinicId,
      this.isShow});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    from = json['from'];
    to = json['to'];
    interval = json['interval'];
    sessionPrice = json['session_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    scheduleType = json['schedule_type'];
    intervalType = json['interval_type'];
    sessionPriceOutside = json['session_price_outside'];
    clinicId = json['clinic_id'];
    isShow = json['is_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['from'] = this.from;
    data['to'] = this.to;
    data['interval'] = this.interval;
    data['session_price'] = this.sessionPrice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['schedule_type'] = this.scheduleType;
    data['interval_type'] = this.intervalType;
    data['session_price_outside'] = this.sessionPriceOutside;
    data['clinic_id'] = this.clinicId;
    data['is_show'] = this.isShow;
    return data;
  }
}

class Information {
  int? id;
  int? userId;
  Null inssurance;
  String? city;
  Null area;
  String? image;
  Null specialities;
  String? createdAt;
  String? updatedAt;
  Null country;
  Null state;
  Null  address;
  String? phone;
  String? gender;
  Null hospital;
  String? clinic;
  String? about;
  String? jobTitle;
  int? rateCount;
  String? embedLink;
  String? jobTitleAr;

  Information(
      {this.id,
      this.userId,
      this.inssurance,
      this.city,
      this.area,
      this.image,
      this.specialities,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.state,
      this.address,
      this.phone,
      this.gender,
      this.hospital,
      this.clinic,
      this.about,
      this.jobTitle,
      this.rateCount,
      this.embedLink,
      this.jobTitleAr});

  Information.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    inssurance = json['inssurance'];
    city = json['city'];
    area = json['area'];
    image = json['image'];
    specialities = json['specialities'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    state = json['state'];
    address = json['address'];
    phone = json['phone'];
    gender = json['gender'];
    hospital = json['hospital'];
    clinic = json['clinic'];
    about = json['about'];
    jobTitle = json['job_title'];
    rateCount = json['rate_count'];
    embedLink = json['embed_link'];
    jobTitleAr = json['job_title_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['inssurance'] = this.inssurance;
    data['city'] = this.city;
    data['area'] = this.area;
    data['image'] = this.image;
    data['specialities'] = this.specialities;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country'] = this.country;
    data['state'] = this.state;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['hospital'] = this.hospital;
    data['clinic'] = this.clinic;
    data['about'] = this.about;
    data['job_title'] = this.jobTitle;
    data['rate_count'] = this.rateCount;
    data['embed_link'] = this.embedLink;
    data['job_title_ar'] = this.jobTitleAr;
    return data;
  }
}

class DoctorSpecialities {
  int? id;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? nameEn;
  String? nameAr;
  Pivot? pivot;

  DoctorSpecialities(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.nameEn,
      this.nameAr,
      this.pivot});

  DoctorSpecialities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
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

class Specialities {
  int? id;
  String? nameSpecialities;
  String? image;
  String? status;

  Specialities({this.id, this.nameSpecialities, this.image, this.status});

  Specialities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSpecialities = json['name_specialities'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_specialities'] = this.nameSpecialities;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? iso3;
  String? numericCode;
  String? iso2;
  String? phonecode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  String? subregion;
  String? timezones;
  String? translations;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;
  String? createdAt;
  String? updatedAt;
  int? flag;
  String? wikiDataId;

  Countries(
      {this.id,
      this.name,
      this.iso3,
      this.numericCode,
      this.iso2,
      this.phonecode,
      this.capital,
      this.currency,
      this.currencyName,
      this.currencySymbol,
      this.tld,
      this.native,
      this.region,
      this.subregion,
      this.timezones,
      this.translations,
      this.latitude,
      this.longitude,
      this.emoji,
      this.emojiU,
      this.createdAt,
      this.updatedAt,
      this.flag,
      this.wikiDataId});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    numericCode = json['numeric_code'];
    iso2 = json['iso2'];
    phonecode = json['phonecode'];
    capital = json['capital'];
    currency = json['currency'];
    currencyName = json['currency_name'];
    currencySymbol = json['currency_symbol'];
    tld = json['tld'];
    native = json['native'];
    region = json['region'];
    subregion = json['subregion'];
    timezones = json['timezones'];
    translations = json['translations'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    flag = json['flag'];
    wikiDataId = json['wikiDataId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso3'] = this.iso3;
    data['numeric_code'] = this.numericCode;
    data['iso2'] = this.iso2;
    data['phonecode'] = this.phonecode;
    data['capital'] = this.capital;
    data['currency'] = this.currency;
    data['currency_name'] = this.currencyName;
    data['currency_symbol'] = this.currencySymbol;
    data['tld'] = this.tld;
    data['native'] = this.native;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['timezones'] = this.timezones;
    data['translations'] = this.translations;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['emoji'] = this.emoji;
    data['emojiU'] = this.emojiU;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['flag'] = this.flag;
    data['wikiDataId'] = this.wikiDataId;
    return data;
  }
}

class Cities {
  int? id;
  String? nameCity;

  Cities({this.id, this.nameCity});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCity = json['name_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_city'] = this.nameCity;
    return data;
  }
}

class SelectedAreas {
  int? id;
  String? nameAreas;

  SelectedAreas({this.id, this.nameAreas});

  SelectedAreas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAreas = json['name_areas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_areas'] = this.nameAreas;
    return data;
  }
}
