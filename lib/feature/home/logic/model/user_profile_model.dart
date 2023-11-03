class UserProfile {
  bool? status;
  String? msg;
  UserProfileData? data;

  UserProfile({this.status, this.msg, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new UserProfileData.fromJson(json['data']) : null;
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

class UserProfileData {
  int? id;
  String? name;
  String? email;
  Information? information;

  UserProfileData({this.id, this.name, this.email, this.information});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    return data;
  }
}

class Information {
  int? id;
  int? userId;
  String? phone;

  Information({this.id, this.userId, this.phone});

  Information.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    return data;
  }
}
