class AkunModel {
  int? code;
  int? id;
  String? level;

  AkunModel({this.code, this.id, this.level});

  AkunModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['id'] = this.id;
    data['level'] = this.level;
    return data;
  }
}
