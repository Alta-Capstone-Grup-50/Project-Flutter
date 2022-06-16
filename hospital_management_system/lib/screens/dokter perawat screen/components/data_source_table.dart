import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/dokterPerawat_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/pasien_data_model.dart';

class DataSourceTable extends DataGridSource {
  List<DataDoktorPerawat> _data;
  List<DataDoktorPerawat> get data => _data;

  List<DataDoktorPerawat> _paginatedData = [];

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
      } else if (dataGridCell.columnName == 'sIP/SIPP') {
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
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Jabatan') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Jenis Kelamin') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Nomor Telepon') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Spesialis') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Jadwal Praktek') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else {
        return Container(
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
        DataGridCell(columnName: 'SIP/SIPP', value: dataGridRow.nomorSIP),
        DataGridCell(columnName: 'Nama', value: dataGridRow.nama),
        DataGridCell(columnName: 'Jabatan', value: dataGridRow.jabatan),
        DataGridCell(
            columnName: 'Jenis Kelamin', value: dataGridRow.jenisKelamin),
        DataGridCell(
            columnName: 'Nomor Telepon', value: dataGridRow.nomorTelfon),
        DataGridCell(columnName: 'Spesialis', value: dataGridRow.spesialis),
        DataGridCell(
            columnName: 'Jadwal Praktek', value: dataGridRow.jadwalPraktek),
        DataGridCell(columnName: 'STR', value: dataGridRow.nomorSTR),
      ]);
    }).toList(growable: false);
  }
}
