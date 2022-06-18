import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../models/pasien_data_model.dart';

class DataSourceTable extends DataGridSource {
  List<DataPasien> _data;
  List<DataPasien> get data => _data;

  List<DataPasien> _paginatedData = [];

  int rowsPerPage = 0;

  DataSourceTable(this._data) {
    _paginatedData = _data.getRange(0, _data.length).toList(growable: false);
    rowsPerPage = _data.length;

    buildPaginatedDataGridRows();
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
          padding: const EdgeInsets.only(right: 16.0),
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
      } else if (dataGridCell.columnName == 'Jenis Kelamin') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Jadwal Rawat Jalan') {
        return Container(
          padding: const EdgeInsets.only(right: 16.0),
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Nomor Antrian') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.center,
          child: dataGridCell.value,
        );
      }
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < _data.length && endIndex <= _data.length) {
      Future.delayed(const Duration(milliseconds: 2000));
      _paginatedData =
          _data.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
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
        DataGridCell(
            columnName: 'Jenis Kelamin', value: dataGridRow.jenisKelamin),
        DataGridCell(
            columnName: 'Jadwal Rawat Jalan', value: dataGridRow.jadwalRawat),
        DataGridCell(columnName: 'Nomor Antrian', value: dataGridRow.noAntrian),
        DataGridCell(
          columnName: 'Ket. Rawat Jalan',
          value: (MaterialButton(
            textColor: Colors.white,
            color: green,
            onPressed: () {},
            child: const Text('Keterangan'),
          )),
        ),
      ]);
    }).toList(growable: false);
  }
}
