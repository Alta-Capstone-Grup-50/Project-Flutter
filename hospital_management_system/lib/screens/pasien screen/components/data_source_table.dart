import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/pasien_data_model.dart';

class DataSourceTable extends DataGridSource {
  List<DataPasien> _data;
  List<DataPasien> get data => _data;

  List<DataPasien> _paginatedData = [];

  int rowsPerPage = 6;
  int restOfPage = 0;
  int startIndex = 0;

  final DataPagerController _controller = DataPagerController();

  DataSourceTable(this._data) {
    _paginatedData = _data.getRange(0, _data.length).toList(growable: false);
    restOfPage = _paginatedData.length - startIndex;

    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int index = effectiveRows.indexOf(row);
    int indexOfNumber = effectiveRows.indexOf(row) + (startIndex + 1);

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
            '$indexOfNumber',
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
    // print("oldPageIndex =  ${oldPageIndex}");
    // print("newPageIndex = ${newPageIndex}");

    // print("restOfPage = $restOfPage");

    // print("paginatedData = ${_paginatedData.length}");

    // print("Data = ${_data.length}");

    startIndex = newPageIndex * rowsPerPage;
    // print("startIndex = $startIndex");

    int endIndex = 0;

    if (_data.length - startIndex <= rowsPerPage) {
      endIndex = _data.length;
      // print('oke');
    } else {
      endIndex = startIndex + rowsPerPage;
    }

    print("endIndex = $endIndex");
    if (startIndex < _data.length && endIndex <= _data.length) {
      // print("Masuk");
      // Future.delayed(const Duration(milliseconds: 2000));
      _paginatedData =
          _data.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();

      _controller.dispose();
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
