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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['id'] = id;
    data['level'] = level;
    return data;
  }
}
