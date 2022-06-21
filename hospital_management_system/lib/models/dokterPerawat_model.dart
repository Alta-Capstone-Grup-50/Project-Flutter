class DokterPerawatModel {
  List<DataDoktorPerawat>? dataDoktorPerawat;

  DokterPerawatModel({this.dataDoktorPerawat});

  DokterPerawatModel.fromJson(Map<String, dynamic> json) {
    if (json['data_doktor_perawat'] != null) {
      dataDoktorPerawat = <DataDoktorPerawat>[];
      json['data_doktor_perawat'].forEach((v) {
        dataDoktorPerawat!.add(DataDoktorPerawat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataDoktorPerawat != null) {
      data['data_doktor_perawat'] =
          dataDoktorPerawat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDoktorPerawat {
  String? nomorSIP;
  String? nama;
  String? jabatan;
  String? jenisKelamin;
  String? nomorTelfon;
  String? spesialis;
  String? jadwalPraktek;
  int? nomorSTR;

  DataDoktorPerawat(
      {this.nomorSIP,
      this.nama,
      this.jabatan,
      this.jenisKelamin,
      this.nomorTelfon,
      this.spesialis,
      this.jadwalPraktek,
      this.nomorSTR});

  DataDoktorPerawat.fromJson(Map<String, dynamic> json) {
    nomorSIP = json['nomor_SIP'];
    nama = json['nama'];
    jabatan = json['jabatan'];
    jenisKelamin = json['jenis_kelamin'];
    nomorTelfon = json['nomor_telfon'];
    spesialis = json['spesialis'];
    jadwalPraktek = json['jadwal_praktek'];
    nomorSTR = json['nomor_STR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomor_SIP'] = nomorSIP;
    data['nama'] = nama;
    data['jabatan'] = jabatan;
    data['jenis_kelamin'] = jenisKelamin;
    data['nomor_telfon'] = nomorTelfon;
    data['spesialis'] = spesialis;
    data['jadwal_praktek'] = jadwalPraktek;
    data['nomor_STR'] = nomorSTR;
    return data;
  }
}
