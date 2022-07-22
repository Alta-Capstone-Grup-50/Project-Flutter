class UpdateDokterModel {
  String? sip;
  String? nama;
  String? jenisKelamin;
  String? poli;
  String? jadwalPraktek;
  String? nomorStr;
  String? nomorTelfon;

  UpdateDokterModel(
      {this.sip,
      this.nama,
      this.jenisKelamin,
      this.poli,
      this.jadwalPraktek,
      this.nomorStr,
      this.nomorTelfon});

  UpdateDokterModel.fromJson(Map<String, dynamic> json) {
    sip = json['sip'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    poli = json['poli'];
    jadwalPraktek = json['jadwal_praktek'];
    nomorStr = json['nomor_str'];
    nomorTelfon = json['nomor_telfon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sip'] = sip;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['poli'] = poli;
    data['jadwal_praktek'] = jadwalPraktek;
    data['nomor_str'] = nomorStr;
    data['nomor_telfon'] = nomorTelfon;
    return data;
  }
}
