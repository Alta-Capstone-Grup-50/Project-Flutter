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
    if (this.dataPasien != null) {
      data['data'] = this.dataPasien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPasien {
  int? id;
  String? nik;
  String? nama;
  String? alamat;
  String? jenisKelamin;
  String? noHp;
  String? tempatLahir;
  String? tanggalLahir;
  List<RekamMedis>? rekamMedis;

  DataPasien(
      {this.id,
      this.nik,
      this.nama,
      this.alamat,
      this.jenisKelamin,
      this.noHp,
      this.tempatLahir,
      this.tanggalLahir,
      this.rekamMedis});

  DataPasien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    noHp = json['no_hp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    if (json['Rekam_medis'] != null) {
      rekamMedis = <RekamMedis>[];
      json['Rekam_medis'].forEach((v) {
        rekamMedis!.add(RekamMedis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_hp'] = noHp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    if (rekamMedis != null) {
      data['Rekam_medis'] = rekamMedis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RekamMedis {
  String? tanggal;
  String? keluhan;
  String? poli;
  String? pemeriksaan;
  String? jenisPenanganan;

  RekamMedis(
      {this.tanggal,
      this.keluhan,
      this.poli,
      this.pemeriksaan,
      this.jenisPenanganan});

  RekamMedis.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    keluhan = json['keluhan'];
    poli = json['poli'];
    pemeriksaan = json['pemeriksaan'];
    jenisPenanganan = json['jenis_penanganan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tanggal'] = tanggal;
    data['keluhan'] = keluhan;
    data['poli'] = poli;
    data['pemeriksaan'] = pemeriksaan;
    data['jenis_penanganan'] = jenisPenanganan;
    return data;
  }
}






// class PasienDataModel {
//   List<DataPasien>? dataPasien;

//   PasienDataModel({this.dataPasien});

//   PasienDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['data_pasien'] != null) {
//       dataPasien = <DataPasien>[];
//       json['data_pasien'].forEach((v) {
//         dataPasien!.add(DataPasien.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (dataPasien != null) {
//       data['data_pasien'] = dataPasien!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class DataPasien {
//   String? nik;
//   String? nama;
//   String? alamat;
//   String? jenisKelamin;
//   String? noTelp;
//   String? tempatLahir;
//   String? tanggalLahir;
//   String? jenisPenyakit;
//   String? jadwalRawat;
//   int? noAntrian;

//   DataPasien({
//     this.nik,
//     this.nama,
//     this.alamat,
//     this.jenisKelamin,
//     this.noTelp,
//     this.tempatLahir,
//     this.tanggalLahir,
//     this.jenisPenyakit,
//     // this.jadwalRawat,
//     // this.noAntrian,
//   });

//   DataPasien.fromJson(Map<String, dynamic> json) {
//     nik = json['nik'];
//     nama = json['nama'];
//     alamat = json['alamat'];
//     jenisKelamin = json['jenis_kelamin'];
//     noTelp = json['no_telp'];
//     tempatLahir = json['tempat_lahir'];
//     tanggalLahir = json['tanggal_lahir'];
//     jenisPenyakit = json['jenis_penyakit'];
//     jadwalRawat = json['jadwal_rawat'];
//     noAntrian = json['no_antrian'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['nik'] = nik;
//     data['nama'] = nama;
//     data['alamat'] = alamat;
//     data['jenis_kelamin'] = jenisKelamin;
//     data['no_telp'] = noTelp;
//     data['tempat_lahir'] = tempatLahir;
//     data['tanggal_lahir'] = tanggalLahir;
//     data['jenis_penyakit'] = jenisPenyakit;
//     data['jadwal_rawat'] = jadwalRawat;
//     data['no_antrian'] = noAntrian;
//     return data;
//   }
// }
