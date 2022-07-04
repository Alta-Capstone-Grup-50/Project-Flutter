import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import '/viewModels/pasien viewModel/pasien_viewModel.dart';

import 'data_source_table.dart';

import '/views/pasien%20screen/components/detailPasien.dart';

class PasienTable {
  Widget buildTable(BuildContext context) {
    return Consumer<PasienProvider>(builder: (context, value, _) {
      if (value.isLoading) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
                child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            )));
      } else {
        var val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listPasienData;
        }
        final PasienDataSourceTable _dataSource =
            PasienDataSourceTable(val, context);

        double countPage = _dataSource.data.length / _dataSource.rowsPerPage;

        double countPageOfSearch =
            value.search.length / _dataSource.rowsPerPage;

        // print("countPageOfSearch = $countPageOfSearch");

        return LayoutBuilder(
          builder: ((context, constraints) => Column(children: [
                SizedBox(
                    width: constraints.maxWidth,
                    height: 310,
                    child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          sortIconColor: Colors.black,
                          headerHoverColor: primaryColor.shade200,
                          headerColor: primaryColor.shade200,
                          rowHoverColor: green.shade300,
                        ),
                        child: SfDataGrid(
                            key: value.keyPasien,
                            source: _dataSource,
                            rowHeight: 40,
                            allowPullToRefresh: true,
                            isScrollbarAlwaysShown: true,
                            columnWidthMode: ColumnWidthMode.fill,
                            onCellTap: (query) {
                              openDetailPasien(
                                  context, query, _dataSource.startIndex);
                            },
                            columns: [
                              GridColumn(
                                  width: 60,
                                  columnName: 'No',
                                  label: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(right: 10),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'NIK',
                                  width: 160,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'NIK',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Nama',
                                  width: 190,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Nama',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Alamat',
                                  width: 300,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Alamat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Nomor Telepon',
                                  width: 150,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: const Text(
                                        'Nomor Telepon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  width: 140,
                                  columnName: 'Jenis Kelamin',
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Jenis Kelamin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  width: 140,
                                  columnName: 'Jenis Penyakit',
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Jenis Penyakit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      )))
                            ]))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (Responsive.isDesktop(context) ||
                                Responsive.isTablet(context) &&
                                    MediaQuery.of(context).orientation ==
                                        Orientation.landscape)
                            ? 200
                            : 0),
                    child: SfDataPagerTheme(
                        data: SfDataPagerThemeData(
                          selectedItemColor: green.shade300,
                          itemBorderRadius: BorderRadius.circular(11),
                        ),
                        child: SfDataPager(
                          pageCount: (value.search.isNotEmpty ||
                                  value.searchController.text.isNotEmpty)
                              ? (value.search.isNotEmpty)
                                  ? countPageOfSearch.ceilToDouble()
                                  : 1
                              : countPage.ceil().toDouble(),
                          direction: Axis.horizontal,
                          delegate: _dataSource,
                        )))
              ])),
        );
      }
    });
  }
}
