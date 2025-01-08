/// token : "QpwL5tke4Pnpja7X4"

class UserModel {
  String? token;
  String? userName;

  UserModel({this.token, this.userName});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['userName'] = userName;
    return data;
  }
}
