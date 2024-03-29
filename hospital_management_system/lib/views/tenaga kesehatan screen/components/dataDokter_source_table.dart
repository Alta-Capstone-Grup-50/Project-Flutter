import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/dokter/data/dokter_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../viewModels/dokter_viewModel/dokter_viewModel.dart';

class DokterDataSourceTable extends DataGridSource {
  final List<DokterModel> _data;
  List<DokterModel> get data => _data;

  late List<DokterModel> _paginatedData;

  int rowsPerPage = 6;
  int restOfPage = 0;
  int startIndex = 0;

  DokterViewModel? _valProvider;

  final DataPagerController _controller = DataPagerController();

  DokterDataSourceTable(this._data, BuildContext context) {
    _valProvider = context.read<DokterViewModel>();
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
          color: getRowBackgroundColor(),
          padding: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          child: Text(
            '$indexOfNumber',
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'SIP/SIPP') {
        return Container(
          color: getRowBackgroundColor(),
          padding: const EdgeInsets.only(right: 16),
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
            child: Text.rich(TextSpan(
                children: dataGridCell.value,
                style: const TextStyle(
                  color: Colors.black,
                ))));
      } else if (dataGridCell.columnName == 'Jenis Kelamin') {
        return Container(
          color: getRowBackgroundColor(),
          padding: const EdgeInsets.only(right: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Poli') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else if (dataGridCell.columnName == 'Jadwal Praktek') {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      } else {
        return Container(
          color: getRowBackgroundColor(),
          padding: const EdgeInsets.only(right: 16),
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
    startIndex = newPageIndex * rowsPerPage;
    int endIndex = 0;

    if (_data.length - startIndex <= rowsPerPage) {
      endIndex = _data.length;
      // print('oke');
    } else {
      endIndex = startIndex + rowsPerPage;
    }
    if (startIndex < _data.length && endIndex <= _data.length) {
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
    _valProvider!.getDataApiDokter();

    notifyListeners();
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        const DataGridCell(columnName: 'No', value: ' '),
        DataGridCell(columnName: 'SIP/SIPP', value: dataGridRow.sip ?? ' '),
        DataGridCell(
            columnName: 'Nama',
            value: _valProvider!.highlightOccurences(
                dataGridRow.nama ?? ' ', _valProvider!.searchController.text)),
        DataGridCell(
            columnName: 'Jenis Kelamin',
            value: (dataGridRow.jenisKelamin!.isNotEmpty)
                ? (dataGridRow.jenisKelamin == 'L')
                    ? 'Laki - laki'
                    : 'Perempuan'
                : ' '),
        DataGridCell(columnName: 'Poli', value: dataGridRow.poli ?? ' '),
        DataGridCell(
            columnName: 'Jadwal Praktek',
            value: dataGridRow.jadwalPraktek ?? ' '),
        DataGridCell(columnName: 'STR', value: dataGridRow.noStr ?? ' '),
      ]);
    }).toList(growable: false);
  }
}
