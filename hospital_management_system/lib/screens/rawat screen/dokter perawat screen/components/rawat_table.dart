import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../utilities/constants/color.dart';
import '../../../../viewModels/rawat viewModel/rawat_provider.dart';
import 'data_source_table.dart';

class RawatTable {
  Widget buildTable(BuildContext context) {
    return Consumer<RawatProvider>(builder: (context, value, _) {
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
          val = value.listPasienData;
        }
        final RawatDataSourceTable _dataSource =
            RawatDataSourceTable(val, context);

        double countPage = _dataSource.data.length / _dataSource.rowsPerPage;

        double countPageOfSearch =
            value.search.length / _dataSource.rowsPerPage;
        return LayoutBuilder(
            builder: ((context, constraints) => Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          sortIconColor: Colors.black,
                          headerHoverColor: primaryColor.shade200,
                          headerColor: primaryColor.shade200,
                          rowHoverColor: primaryColor,
                        ),
                        child: SfDataGrid(
                          rowHeight: 40,
                          allowPullToRefresh: true,
                          isScrollbarAlwaysShown: true,
                          source: _dataSource,
                          columnWidthMode: ColumnWidthMode.fill,
                          columns: [
                            GridColumn(
                              columnName: 'No',
                              width: 60,
                              label: Container(
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
                              columnName: 'NIK',
                              width: 160,
                              label: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'NIK',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              columnName: 'Nama',
                              width: 190,
                              label: Container(
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
                              width: 130,
                              label: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Jenis Kelamin',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              columnName: 'Jadwal Rawat Jalan',
                              label: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Jadwal Rawat Jalan',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              columnName: 'Nomor Antrian',
                              label: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Nomor Antrian',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              columnName: 'Ket. Rawat Jalan',
                              label: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Ket. Rawat Jalan',
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
                          selectedItemColor: primaryColor.shade200,
                          itemBorderRadius: BorderRadius.circular(11),
                        ),
                        child: SfDataPager(
                          firstPageItemVisible: false,
                          lastPageItemVisible: false,
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
                )));
      }
    });
  }
}
