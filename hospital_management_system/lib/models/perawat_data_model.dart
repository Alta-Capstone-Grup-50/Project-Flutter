class PerawatDataModel {
  int? code;
  List<DataPerawat>? dataPerawat;

  PerawatDataModel({this.code, this.dataPerawat});

  PerawatDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      dataPerawat = <DataPerawat>[];
      json['data'].forEach((v) {
        dataPerawat!.add(DataPerawat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (dataPerawat != null) {
      data['data'] = dataPerawat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPerawat {
  int? idUser;
  String? sip;
  String? namaPerawat;
  String? jenisKelamin;
  String? poli;
  String? jadwalKerja;
  String? jabatan;
  String? nomorTelfon;
  String? nomorStr;

  DataPerawat(
      {this.idUser,
      this.sip,
      this.namaPerawat,
      this.jenisKelamin,
      this.poli,
      this.jadwalKerja,
      this.jabatan,
      this.nomorTelfon,
      this.nomorStr});

  DataPerawat.fromJson(Map<String, dynamic> json) {
    idUser = json['id'];
    sip = json['sip'];
    namaPerawat = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    jadwalKerja = json['jadwal_kerja'];
    jabatan = json['jabatan'];
    nomorTelfon = json['nomor_telfon'];
    nomorStr = json['nomor_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['sip'] = sip;
    data['nama_perawat'] = namaPerawat;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['jadwal_kerja'] = jadwalKerja;
    data['jabatan'] = jabatan;
    data['nomor_telfon'] = nomorTelfon;
    data['nomor_str'] = nomorStr;
    return data;
  }
}
