class PasienDataModel {
  List<DataPasien>? dataPasien;

  PasienDataModel({this.dataPasien});

  PasienDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data_pasien'] != null) {
      dataPasien = <DataPasien>[];
      json['data_pasien'].forEach((v) {
        dataPasien!.add(DataPasien.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataPasien != null) {
      data['data_pasien'] = dataPasien!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPasien {
  String? nik;
  String? nama;
  String? alamat;
  String? jenisKelamin;
  String? noTelp;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisPenyakit;
  String? jadwalRawat;
  int? noAntrian;

  DataPasien({
    this.nik,
    this.nama,
    this.alamat,
    this.jenisKelamin,
    this.noTelp,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisPenyakit,
    // this.jadwalRawat,
    // this.noAntrian,
  });

  DataPasien.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    noTelp = json['no_telp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisPenyakit = json['jenis_penyakit'];
    jadwalRawat = json['jadwal_rawat'];
    noAntrian = json['no_antrian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_telp'] = noTelp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_penyakit'] = jenisPenyakit;
    data['jadwal_rawat'] = jadwalRawat;
    data['no_antrian'] = noAntrian;
    return data;
  }
}
