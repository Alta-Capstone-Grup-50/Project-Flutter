import 'package:flutter/material.dart';

import '../../models/pasien_data_model.dart';

class PasienData extends DataTableSource {
  final List<DataPasien> _data;

  PasienData(this._data) {
    print(_data);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(_data[index].nik!)),
      DataCell(Text(_data[index].nama!)),
      DataCell(Text(_data[index].alamat!)),
      DataCell(Text(_data[index].jenisKelamin!)),
      DataCell(Text(_data[index].jenisPenyakit!)),
    ]);
  }
}
