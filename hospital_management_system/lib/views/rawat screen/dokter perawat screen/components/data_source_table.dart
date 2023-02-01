import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';
import 'package:hospital_management_system/utilities/common/case_dialog.dart';
import 'package:hospital_management_system/viewModels/login_viewModel/login_viewModel.dart';

import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../utilities/common/progress_dialog.dart';
import '../../../../viewModels/rawatJalan_viewModel/rawatJalan_viewModel.dart';

class RawatDataSourceTable extends DataGridSource {
  final List<RawatJalanModel> _data;
  List<RawatJalanModel> _paginatedData = [];
  RawatJalanViewModel? _valProvider;
  LoginProvider? _logProvider;
  final DataPagerController _controller = DataPagerController();
  var contexts;
  ProgressDialog? _loadingWidget;
  final int _rowsPerPage = 6;
  int _restOfPage = 0;
  int _startIndex = 0;

  List<RawatJalanModel> get data => _data;
  int get rowsPerPage => _rowsPerPage;
  int get startIndex => _startIndex;

  RawatDataSourceTable(this._data, BuildContext context) {
    contexts = context;
    _valProvider = context.read<RawatJalanViewModel>();
    _logProvider = context.watch<LoginProvider>();
    _loadingWidget = ProgressDialog(
      context,
      isDismissible: false,
    );

    _loadingWidget!.style(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30));

    _paginatedData = _data.getRange(0, _data.length).toList(growable: false);
    _restOfPage = _paginatedData.length - _startIndex;

    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int index = effectiveRows.indexOf(row);
    int indexOfNumber = effectiveRows.indexOf(row) + (_startIndex + 1);
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
            color: getRowBackgroundColor(),
            padding: const EdgeInsets.only(right: 16.0),
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                  children: dataGridCell.value,
                  style: const TextStyle(
                    color: Colors.black,
                  )),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Nama') {
        return Container(
            padding: const EdgeInsets.only(left: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                  children: dataGridCell.value,
                  style: const TextStyle(
                    color: Colors.black,
                  )),
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
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25.0),
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
          padding: const EdgeInsets.only(right: 20.0),
          alignment: Alignment.center,
          child: dataGridCell.value,
        );
      }
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    _startIndex = newPageIndex * _rowsPerPage;
    int endIndex = 0;
    if (_data.length - _startIndex <= _rowsPerPage) {
      endIndex = _data.length;
      // print('oke');
    } else {
      endIndex = _startIndex + _rowsPerPage;
    }
    if (_startIndex < _data.length && endIndex <= _data.length) {
      _paginatedData =
          _data.getRange(_startIndex, endIndex).toList(growable: false);
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
    _valProvider!.getDataApiRawatJalan();

    notifyListeners();
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        const DataGridCell(columnName: 'No', value: '-'),
        DataGridCell(
            columnName: 'NIK',
            value: _valProvider!.highlightOccurences(
                dataGridRow.nik ?? '-', _valProvider!.searchController.text)),
        DataGridCell(
            columnName: 'Nama',
            value: _valProvider!.highlightOccurences(
                dataGridRow.nama ?? '-', _valProvider!.searchController.text)),
        DataGridCell(
            columnName: 'Jenis Kelamin',
            value: (dataGridRow.jenisKelamin!.isNotEmpty)
                ? (dataGridRow.jenisKelamin == 'L')
                    ? 'Laki - laki'
                    : 'Perempuan'
                : ' '),
        DataGridCell(
            columnName: 'Jadwal Rawat Jalan',
            value: dataGridRow.jadwalRawatJalan ?? '-'),
        DataGridCell(
            columnName: 'Nomor Antrian', value: dataGridRow.noAntrian ?? '-'),
        DataGridCell(
          columnName: 'Proses',
          value: Checkbox(
              value: dataGridRow.proses ?? false,
              onChanged: (bool? newValue) {
                if (_logProvider!.user.level == 'Dokter' ||
                    _logProvider!.user.level == 'Perawat') {
                  if (dataGridRow.proses == false) {
                    showCaseDialog(contexts,
                        title: 'Konfirmasi',
                        label:
                            "Apa anda sudah yakin untuk menyelesaikan rawat jalan\npasien ini pada hari ini?",
                        onPressed: () async {
                      Navigator.of(contexts).pop();
                      await _loadingWidget!.show();
                      await Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          dataGridRow = dataGridRow.copyWith(proses: newValue);
                          _valProvider!.putProsesAntrian(
                              dataGridRow.id!, dataGridRow.proses!);
                          _valProvider!.listRawatJalanData!.sort((a, b) => a
                              .proses
                              .toString()
                              .compareTo(b.proses.toString()));
                          _valProvider!.getCurrentAntrian();
                          notifyListeners();
                        },
                      );
                      _loadingWidget!.hide();
                    });
                  } else {
                    return;
                  }
                }
              }),
        ),
      ]);
    }).toList(growable: false);
  }
}
