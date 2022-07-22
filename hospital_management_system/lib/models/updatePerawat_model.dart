class UpdatePerawatModel {
  String? sip;
  String? nama;
  String? jenisKelamin;
  String? poli;
  String? jadwalKerja;
  String? jabatan;
  String? nomorTelfon;
  String? nomorStr;

  UpdatePerawatModel(
      {this.sip,
      this.nama,
      this.jenisKelamin,
      this.poli,
      this.jadwalKerja,
      this.jabatan,
      this.nomorTelfon,
      this.nomorStr});

  UpdatePerawatModel.fromJson(Map<String, dynamic> json) {
    sip = json['sip'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    jadwalKerja = json['jadwal_kerja'];
    jabatan = json['jabatan'];
    nomorTelfon = json['nomor_telfon'];
    nomorStr = json['nomor_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sip'] = sip;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['jadwal_kerja'] = jadwalKerja;
    data['jabatan'] = jabatan;
    data['nomor_telfon'] = nomorTelfon;
    data['nomor_str'] = nomorStr;
    return data;
  }
}
