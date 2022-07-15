import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../utilities/constants/responsive.dart';
import '../../../viewModels/dokter perawat viewModel/perawat_viewModel.dart';
import '/utilities/constants/color.dart';

import 'dataPerawat_source_table.dart';
import 'detailData_perawat.dart';

class PerawatTable {
  Widget buildTable(BuildContext context) {
    return Consumer<PerawatViewModel>(builder: (context, value, _) {
      if (value.fetchStatusPerawat == StatusFetchPerawat.isLoading) {
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
      } else if (value.fetchStatusPerawat == StatusFetchPerawat.letsGo) {
        var val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listPerawatData;
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
                    height: (_dataSource.data.length <= 2)
                        ? 160
                        : (_dataSource.data.length <= 4)
                            ? 240
                            : 320,
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        sortIconColor: Colors.black,
                        headerHoverColor: primaryColor.shade200,
                        headerColor: primaryColor.shade200,
                        rowHoverColor: green.shade300,
                      ),
                      child: SfDataGrid(
                        key: value.keyPerawat,
                        isScrollbarAlwaysShown: true,
                        rowHeight: 40,
                        allowPullToRefresh: true,
                        source: _dataSource,
                        columnWidthMode: ColumnWidthMode.fill,
                        onCellTap: (query) {
                          if (query.rowColumnIndex.rowIndex > 0) {
                            openDetailPerawat(
                                context, query, _dataSource.startIndex);
                          } else {
                            return;
                          }
                        },
                        columns: [
                          GridColumn(
                            width: 60,
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
                            width: 140,
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
                            width: 210,
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
                            width: 150,
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
                            columnName: 'Poli',
                            label: Container(
                              color: primaryColor.shade200,
                              padding: const EdgeInsets.only(right: 16),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Poli',
                                style: TextStyle(fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Jadwal Kerja',
                            width: 250,
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
                          GridColumn(
                            columnName: 'Jabatan',
                            width: 130,
                            label: Container(
                              color: primaryColor.shade200,
                              padding: const EdgeInsets.only(right: 16),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Jabatan',
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
                      ),
                    ),
                  ),
                ],
              )),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
