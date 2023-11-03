class ProfileModel {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? image;
  Null zoomEmail;
  Null zoomId;
  Null zoomLink;
  String? residence;
  int? myPrice;
  Null nameAr;
  int? isAdd;
  String? onlinePrice;
  String? oflinePrice;
  String? onlinePriceOutside;
  String? oflinePriceOutside;
  Null waitingTime;
  Null csNumber;
  String? percentage;
  int? isShow;
  int? percentageOutside;
  int? oflinePercentage;

  ProfileModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.zoomEmail,
      this.zoomId,
      this.zoomLink,
      this.residence,
      this.myPrice,
      this.nameAr,
      this.isAdd,
      this.onlinePrice,
      this.oflinePrice,
      this.onlinePriceOutside,
      this.oflinePriceOutside,
      this.waitingTime,
      this.csNumber,
      this.percentage,
      this.isShow,
      this.percentageOutside,
      this.oflinePercentage});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    zoomEmail = json['zoom_email'];
    zoomId = json['zoom_id'];
    zoomLink = json['zoom_link'];
    residence = json['residence'];
    myPrice = json['my_price'];
    nameAr = json['name_ar'];
    isAdd = json['is_add'];
    onlinePrice = json['online_price'];
    oflinePrice = json['ofline_price'];
    onlinePriceOutside = json['online_price_outside'];
    oflinePriceOutside = json['ofline_price_outside'];
    waitingTime = json['waiting_time'];
    csNumber = json['cs_number'];
    percentage = json['percentage'];
    isShow = json['is_show'];
    percentageOutside = json['percentage_outside'];
    oflinePercentage = json['ofline_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['zoom_email'] = this.zoomEmail;
    data['zoom_id'] = this.zoomId;
    data['zoom_link'] = this.zoomLink;
    data['residence'] = this.residence;
    data['my_price'] = this.myPrice;
    data['name_ar'] = this.nameAr;
    data['is_add'] = this.isAdd;
    data['online_price'] = this.onlinePrice;
    data['ofline_price'] = this.oflinePrice;
    data['online_price_outside'] = this.onlinePriceOutside;
    data['ofline_price_outside'] = this.oflinePriceOutside;
    data['waiting_time'] = this.waitingTime;
    data['cs_number'] = this.csNumber;
    data['percentage'] = this.percentage;
    data['is_show'] = this.isShow;
    data['percentage_outside'] = this.percentageOutside;
    data['ofline_percentage'] = this.oflinePercentage;
    return data;
  }
}
