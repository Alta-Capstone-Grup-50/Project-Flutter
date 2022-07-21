class RawatJalanDataModel {
  int? code;
  List<DataRawatJalan>? dataRawatJalan;

  RawatJalanDataModel({this.code, this.dataRawatJalan});

  RawatJalanDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      dataRawatJalan = <DataRawatJalan>[];
      json['data'].forEach((v) {
        dataRawatJalan!.add(DataRawatJalan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (dataRawatJalan != null) {
      data['data'] = dataRawatJalan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRawatJalan {
  int? id;
  String? nik;
  String? nama;
  String? alamat;
  String? jenisKelamin;
  String? jadwalRawatJalan;
  String? nomerAntrian;
  bool? proses;
  String? keterangan;
  String? noHp;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisPenyakit;
  String? jenisPenanganan;

  DataRawatJalan({
    this.id,
    this.nik,
    this.nama,
    this.alamat,
    this.jenisKelamin,
    this.jadwalRawatJalan,
    this.nomerAntrian,
    this.proses,
    this.keterangan,
    this.noHp,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisPenyakit,
    this.jenisPenanganan,
  });

  DataRawatJalan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    jadwalRawatJalan = json['jadwal_rawat_jalan'];
    nomerAntrian = json['nomer_antrian'];
    proses = json['proses'];
    keterangan = json['keterangan'];
    noHp = json['no_hp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisPenyakit = json['jenis_penyakit'];
    jenisPenanganan = json['jenis_penanganan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jenis_kelamin'] = jenisKelamin;
    data['jadwal_rawat_jalan'] = jadwalRawatJalan;
    data['nomer_antrian'] = nomerAntrian;
    data['proses'] = proses;
    data['keterangan'] = keterangan;
    data['no_hp'] = noHp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_penyakit'] = jenisPenyakit;
    data['jenis_penanganan'] = jenisPenanganan;
    return data;
  }
}
