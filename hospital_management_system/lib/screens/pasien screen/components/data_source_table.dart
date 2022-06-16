import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/pasien_data_model.dart';

class DataSourceTable extends DataGridSource {
  List<DataPasien> _data;
  List<DataPasien> get data => _data;

  List<DataPasien> _paginatedData = [];

  int rowsPerPage = 0;

  DataSourceTable(this._data) {
    _paginatedData = _data.getRange(0, _data.length).toList(growable: false);
    rowsPerPage = _data.length;
    List index = [];
    int count = 0;
    for (int i = 1; i <= _data.length;) {
      count = i;
      index.add(count);
      i++;
    }
    buildPaginatedDataGridRows();

    print(_data);
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int index = effectiveRows.indexOf(row);
    Color getRowBackgroundColor() {
      if (index % 2 != 1) {
        return const Color(0xFFE2E2E2).withOpacity(0.47);
      }
      return Colors.transparent;
    }

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'No') {
        return Container(
          padding: const EdgeInsets.only(left: 16.0),
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            '${index + 1}',
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'NIK') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Nama') {
        return Container(
            padding: const EdgeInsets.only(right: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Alamat') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Nomor telepon') {
        return Container(
          padding: const EdgeInsets.only(right: 16.0),
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Jenis Kelamin') {
        return Container(
          padding: const EdgeInsets.only(right: 16.0),
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.only(right: 16.0),
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < _data.length && endIndex <= _data.length) {
      await Future.delayed(const Duration(milliseconds: 2000));
      _paginatedData =
          _data.getRange(startIndex, endIndex).toList(growable: false);

      notifyListeners();
    } else {
      _paginatedData = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        const DataGridCell(columnName: 'No', value: null),
        DataGridCell(columnName: 'NIK', value: dataGridRow.nik),
        DataGridCell(columnName: 'Nama', value: dataGridRow.nama),
        DataGridCell(columnName: 'Alamat', value: dataGridRow.alamat),
        DataGridCell(columnName: 'Nomor telepon', value: dataGridRow.noTelp),
        DataGridCell(
            columnName: 'Jenis Kelamin', value: dataGridRow.jenisKelamin),
        DataGridCell(
            columnName: 'Jenis Penyakit', value: dataGridRow.jenisPenyakit),
      ]);
    }).toList(growable: false);
  }
}
