class UpdateRawatData {
  String? jadwalRawatJalan;

  UpdateRawatData({this.jadwalRawatJalan});

  UpdateRawatData.fromJson(Map<String, dynamic> json) {
    jadwalRawatJalan = json['jadwal_rawat_jalan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jadwal_rawat_jalan'] = jadwalRawatJalan;
    return data;
  }
}
