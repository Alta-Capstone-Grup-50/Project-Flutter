class ManageDataModel {
  int? code;
  List<DataManage>? dataManage;

  ManageDataModel({this.code, this.dataManage});

  ManageDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      dataManage = <DataManage>[];
      json['data'].forEach((v) {
        dataManage!.add(DataManage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (dataManage != null) {
      data['data'] = dataManage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataManage {
  int? id;
  String? sip;
  String? nama;
  String? jenisKelamin;
  String? email;
  String? password;
  String? level;

  DataManage(
      {this.id,
      this.sip,
      this.nama,
      this.jenisKelamin,
      this.email,
      this.password,
      this.level});

  DataManage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sip = json['sip'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    email = json['email'];
    password = json['password'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sip'] = sip;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['email'] = email;
    data['password'] = password;
    data['level'] = level;
    return data;
  }
}
