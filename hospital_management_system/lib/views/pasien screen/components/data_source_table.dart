import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';
import '../../../viewModels/pasien_viewModel/pasien_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PasienDataSourceTable extends DataGridSource {
  final List<PasienModel> _data;
  List<PasienModel> get data => _data;

  List<PasienModel> _paginatedData = [];
  List<PasienModel> get paginatedData => _paginatedData;

  int rowsPerPage = 6;
  int restOfPage = 0;
  int startIndex = 0;
  int endIndex = 0;

  PasienViewModel? _valProvider;

  final DataPagerController _controller = DataPagerController();

  PasienDataSourceTable(this._data, BuildContext context) {
    _valProvider = context.read<PasienViewModel>();

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
      } else if (dataGridCell.columnName == 'Jenis Kelamin') {
        return Container(
            padding: const EdgeInsets.only(right: 16.0),
            color: getRowBackgroundColor(),
            alignment: Alignment.center,
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Alamat') {
        return Container(
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      } else if (dataGridCell.columnName == 'Poli') {
        return Container(
            color: getRowBackgroundColor(),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 16.0, left: 20.0),
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
    }).toList(growable: false));
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    startIndex = newPageIndex * rowsPerPage;

    if (_data.length - startIndex <= rowsPerPage) {
      endIndex = _data.length;
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
    _valProvider!.getDataApiPasien();

    notifyListeners();
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedData.map<DataGridRow>((dataGridRow) {
      // var lastRekamMedis = null;
      // lastRekamMedis = dataGridRow.rekamMedis!.isNotEmpty
      //     ? (dataGridRow.rekamMedis!.last.poli)
      //     : '-';

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
            value: (dataGridRow.jenisKelamin != null)
                ? (dataGridRow.jenisKelamin == 'L')
                    ? 'Laki - laki'
                    : 'Perempuan'
                : ' '),
        DataGridCell(columnName: 'Alamat', value: dataGridRow.alamat ?? '-'),
        DataGridCell(columnName: 'Poli', value: dataGridRow.poli ?? '-'),
        DataGridCell(
            columnName: 'Nomor Telepon', value: dataGridRow.noTelepon ?? '-'),
      ]);
    }).toList(growable: false);
  }
}
