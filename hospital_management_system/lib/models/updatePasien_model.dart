class UpdatePasienData {
  String? nik;
  String? nama;
  String? alamat;
  String? jenisKelamin;
  String? poli;
  String? noHp;
  String? tempatLahir;
  String? tanggalLahir;

  UpdatePasienData(
      {this.nik,
      this.nama,
      this.alamat,
      this.jenisKelamin,
      this.poli,
      this.noHp,
      this.tempatLahir,
      this.tanggalLahir});

  UpdatePasienData.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    noHp = json['no_hp'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['no_hp'] = noHp;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    return data;
  }
}
