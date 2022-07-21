class DetailAkunModel {
  String? email;
  String? password;

  DetailAkunModel({this.email, this.password});

  DetailAkunModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
