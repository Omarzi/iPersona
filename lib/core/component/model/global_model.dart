class GlobalModel {
  bool? success;
  String? msg;

  GlobalModel({this.success, this.msg});

  GlobalModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    return data;
  }
}
class GlobalModel2 {
  bool? status;
  String? msg;
 

  GlobalModel2({this.status, this.msg});

  GlobalModel2.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    return data;
  }
}
