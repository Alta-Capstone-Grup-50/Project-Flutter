class PasienDataModel {
  int? code;
  List<DataPasien>? dataPasien;

  PasienDataModel({this.code, this.dataPasien});

  PasienDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      dataPasien = <DataPasien>[];
      json['data'].forEach((v) {
        dataPasien!.add(DataPasien.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (dataPasien != null) {
      data['data'] = dataPasien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPasien {
  int? id;
  String? nik;
  String? nama;
  String? jenisKelamin;
  String? poli;
  String? namaDokter;
  String? alamat;
  String? noHp;
  String? tempatLahir;
  String? tanggalLahir;

  DataPasien(
      {this.id,
      this.nik,
      this.nama,
      this.jenisKelamin,
      this.poli,
      this.namaDokter,
      this.alamat,
      this.noHp,
      this.tempatLahir,
      this.tanggalLahir});

  DataPasien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    namaDokter = json['nama_dokter'];
    alamat = json['alamat'];
    noHp = json['no_hp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nik'] = nik;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['nama_dokter'] = namaDokter;
    data['alamat'] = alamat;
    data['no_hp'] = noHp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    return data;
  }
}

