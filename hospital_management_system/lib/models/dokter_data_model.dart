class DokterDataModel {
  int? code;
  List<DataDokter>? dataDokter;

  DokterDataModel({this.code, this.dataDokter});

  DokterDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      dataDokter = <DataDokter>[];
      json['data'].forEach((v) {
        dataDokter!.add(DataDokter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (dataDokter != null) {
      data['data'] = dataDokter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDokter {
  int? idUser;
  String? sip;
  String? namaDokter;
  String? poli;
  String? jenisKelamin;
  String? jadwalPraktek;
  String? nomorStr;
  String? nomorTelfon;

  DataDokter(
      {this.idUser,
      this.sip,
      this.namaDokter,
      this.poli,
      this.jenisKelamin,
      this.jadwalPraktek,
      this.nomorStr,
      this.nomorTelfon});

  DataDokter.fromJson(Map<String, dynamic> json) {
    idUser = json['id'];
    sip = json['sip'];
    namaDokter = json['nama'];
    poli = json['poli'];
    jenisKelamin = json['jenis_kelamin'];
    jadwalPraktek = json['jadwal_praktek'];
    nomorStr = json['nomor_str'];
    nomorTelfon = json['nomor_telfon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['sip'] = sip;
    data['nama_dokter'] = namaDokter;
    data['poli'] = poli;
    data['jenis_kelamin'] = jenisKelamin;
    data['jadwal_praktek'] = jadwalPraktek;
    data['nomor_str'] = nomorStr;
    data['nomor_telfon'] = nomorTelfon;
    return data;
  }
}
