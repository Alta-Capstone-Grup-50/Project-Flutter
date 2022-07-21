class KeteranganModel {
  List<DataKeterangan>? dataKeterangan;

  KeteranganModel({this.dataKeterangan});

  KeteranganModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataKeterangan = <DataKeterangan>[];
      json['data'].forEach((v) {
        dataKeterangan!.add(DataKeterangan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataKeterangan != null) {
      data['data'] = dataKeterangan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataKeterangan {
  int? id;
  String? namaPasien;
  String? keterangan;
  String? tanggal;

  DataKeterangan({this.id, this.namaPasien, this.keterangan, this.tanggal});

  DataKeterangan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPasien = json['namaPasien'];
    keterangan = json['keterangan'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataKeterangan = <String, dynamic>{};
    dataKeterangan['id'] = id;
    dataKeterangan['namaPasien'] = namaPasien;
    dataKeterangan['keterangan'] = keterangan;
    dataKeterangan['tanggal'] = tanggal;
    return dataKeterangan;
  }
}
