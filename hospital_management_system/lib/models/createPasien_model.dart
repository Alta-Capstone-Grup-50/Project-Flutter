class CreatePasienData {
  String? nik;
  String? nama;
  String? jenisKelamin;
  String? poli;
  String? alamat;
  String? noHp;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisPenanganan;

  CreatePasienData(
      {this.nik,
      this.nama,
      this.jenisKelamin,
      this.poli,
      this.alamat,
      this.noHp,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisPenanganan});

  CreatePasienData.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    alamat = json['alamat'];
    noHp = json['no_hp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisPenanganan = json['jenis_penanganan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['alamat'] = alamat;
    data['no_hp'] = noHp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_penanganan'] = jenisPenanganan;
    return data;
  }
}
