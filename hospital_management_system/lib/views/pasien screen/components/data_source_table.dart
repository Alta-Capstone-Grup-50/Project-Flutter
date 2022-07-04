import 'package:flutter/material.dart';
import '/viewModels/pasien%20viewModel/pasien_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/pasien_data_model.dart';

class PasienDataSourceTable extends DataGridSource {
  List<DataPasien> _data;
  List<DataPasien> get data => _data;

  List<DataPasien> _paginatedData = [];

  int rowsPerPage = 6;
  int restOfPage = 0;
  int startIndex = 0;

  PasienProvider? valProvider;

  final DataPagerController _controller = DataPagerController();

  PasienDataSourceTable(this._data, BuildContext context) {
    valProvider = context.read<PasienProvider>();

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
          padding: const EdgeInsets.only(right: 10),
          color: getRowBackgroundColor(),
          alignment: Alignment.center,
          child: Text(
            '$indexOfNumber',
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'NIK') {
        return Container(
            padding: const EdgeInsets.only(right: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(
                children: dataGridCell.value,
                style: const TextStyle(
                  color: Colors.black,
                ))));
      } else if (dataGridCell.columnName == 'Nama') {
        return Container(
            padding: const EdgeInsets.only(right: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(
                children: dataGridCell.value,
                style: const TextStyle(
                  color: Colors.black,
                ))));
      } else if (dataGridCell.columnName == 'Alamat') {
        return Container(
            padding: const EdgeInsets.only(right: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Nomor telepon') {
        return Container(
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 16.0),
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
            ));
      } else {
        return Container(
            color: getRowBackgroundColor(),
            padding: const EdgeInsets.only(right: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
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

    // print("endIndex = $endIndex");
    if (startIndex < _data.length && endIndex <= _data.length) {
      // print("Masuk");

      _paginatedData =
          _data.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      _controller.dispose();
      notifyListeners();
    } else {
      _paginatedData = [];
    }
    return true;
  }

  @override
  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 4));
    buildPaginatedDataGridRows();
    valProvider!.getDataApiPasien();

    notifyListeners();
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      // print(valProvider!.highlightOccurences(
      //     dataGridRow.nama!, valProvider!.searchController.text));
      return DataGridRow(cells: [
        const DataGridCell(columnName: 'No', value: ' '),
        DataGridCell(
            columnName: 'NIK',
            value: valProvider!.highlightOccurences(
                dataGridRow.nik ?? ' ', valProvider!.searchController.text)),
        DataGridCell(
            columnName: 'Nama',
            value: valProvider!.highlightOccurences(
                dataGridRow.nama ?? ' ', valProvider!.searchController.text)),
        DataGridCell(columnName: 'Alamat', value: dataGridRow.alamat ?? ' '),
        DataGridCell(
            columnName: 'Nomor telepon', value: dataGridRow.noTelp ?? ' '),
        DataGridCell(
            columnName: 'Jenis Kelamin',
            value: dataGridRow.jenisKelamin ?? ' '),
        DataGridCell(
            columnName: 'Jenis Penyakit',
            value: dataGridRow.jenisPenyakit ?? ' '),
      ]);
    }).toList(growable: false);
  }
}
