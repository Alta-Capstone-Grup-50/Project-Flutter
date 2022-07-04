import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/utilities/constants/color.dart';
import '/viewModels/dokter perawat viewModel/dokterPerawat_viewModel.dart';

import 'dataPerawat_source_table.dart';

class PerawatTable {
  Widget buildTable(BuildContext context) {
    return Consumer<DokterPerawatProvider>(builder: (context, value, _) {
      if (value.isLoading) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        var val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listDokterPerawatData;
        }
        final PerawatDataSourceTable _dataSource =
            PerawatDataSourceTable(val, context);

        double countPage = _dataSource.data.length / _dataSource.rowsPerPage;

        double countPageOfSearch =
            value.search.length / _dataSource.rowsPerPage;
        return LayoutBuilder(
          builder: ((context, constraints) => Column(
                children: [
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
                        key: value.keyDokterPerawat,
                        isScrollbarAlwaysShown: true,
                        rowHeight: 40,
                        allowPullToRefresh: true,
                        source: _dataSource,
                        columnWidthMode: ColumnWidthMode.lastColumnFill,
                        columns: [
                          GridColumn(
                            columnName: 'No',
                            label: Container(
                              color: primaryColor.shade200,
                              padding: const EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'No',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'SIP/SIPP',
                            label: Container(
                              padding: const EdgeInsets.only(right: 16),
                              color: primaryColor.shade200,
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'SIP/SIPP',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Nama',
                            label: Container(
                              color: primaryColor.shade200,
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Nama',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Jenis Kelamin',
                            label: Container(
                              color: primaryColor.shade200,
                              padding: const EdgeInsets.only(right: 16),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Jenis Kelamin',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Bagian Kerja',
                            label: Container(
                              color: primaryColor.shade200,
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Bagian Kerja',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Jadwal Kerja',
                            label: Container(
                              color: primaryColor.shade200,
                              padding: const EdgeInsets.only(right: 16),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Jadwal Kerja',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 250),
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
                      ),
                    ),
                  ),
                ],
              )),
        );
      }
    });
  }
}
