import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../viewModels/login_viewModel/login_viewModel.dart';
import '../../../../viewModels/rawatJalan_viewModel/rawatJalan_viewModel.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import 'data_source_table.dart';
import 'detailRawatJalan.dart';

class RawatTable {
  Widget buildTable(BuildContext context) {
    RawatJalanViewModel init = context.read<RawatJalanViewModel>();
    LoginProvider valueProvide = context.watch<LoginProvider>();

    if (valueProvide.user.level == 'Dokter' ||
        valueProvide.user.level == 'Perawat') {
      init.getDataApiRawatJalan();
    } else if (valueProvide.user.level != 'Dokter' ||
        valueProvide.user.level != 'Perawat') {
      init.getDataApiRawatJalanAdmin();
    }
    return Consumer<RawatJalanViewModel>(builder: (context, value, _) {
      if (value.fetchStatusRawat == StatusFetchRawat.isLoading) {
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
      } else if (value.fetchStatusRawat == StatusFetchRawat.letsGo) {
        List<RawatJalanModel> val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listRawatJalanData!;
        }
        final RawatDataSourceTable dataSource =
            RawatDataSourceTable(val, context);
        double countPage;
        if (dataSource.data.isEmpty) {
          countPage = 1;
        } else {
          countPage = dataSource.data.length / dataSource.rowsPerPage;
        }

        double countPageOfSearch = value.search.length / dataSource.rowsPerPage;
        return LayoutBuilder(
            builder: ((context, constraints) => Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: (dataSource.data.length <= 2)
                          ? 160
                          : (dataSource.data.length <= 4)
                              ? 240
                              : 305,
                      child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          sortIconColor: Colors.black,
                          headerHoverColor: grey.shade100,
                          headerColor: grey.shade100,
                          rowHoverColor: green.shade300,
                        ),
                        child: Stack(children: [
                          SfDataGrid(
                            key: value.keyRawat,
                            rowHeight: 40,
                            allowPullToRefresh: true,
                            isScrollbarAlwaysShown: true,
                            source: dataSource,
                            columnWidthMode: ColumnWidthMode.lastColumnFill,
                            onCellTap: (query) {
                              if (query.rowColumnIndex.rowIndex > 0) {
                                openDetailRawatJalan(
                                    context, query, dataSource.startIndex);
                              } else {
                                return;
                              }
                            },
                            columns: [
                              GridColumn(
                                columnName: 'No',
                                width: 60,
                                label: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                width: 140,
                                columnName: 'NIK',
                                label: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'NIK',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                width: 170,
                                columnName: 'Nama',
                                label: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: const Text(
                                    'Nama',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                columnName: 'Jenis Kelamin',
                                label: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'Jenis Kelamin',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                columnName: 'Jadwal Rawat Jalan',
                                width: 250,
                                label: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: const Text(
                                    'Jadwal Rawat Jalan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                width: 150,
                                columnName: 'Nomor Antrian',
                                label: Container(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Nomor Antrian',
                                    maxLines: 2,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              GridColumn(
                                width: 120,
                                columnName: 'Proses',
                                label: Container(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Proses',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          (dataSource.data.isEmpty)
                              ? const Center(child: Text('Data Kosong'))
                              : const SizedBox.shrink(),
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: (Responsive.isDesktop(context) ||
                                Responsive.isTablet(context) &&
                                    MediaQuery.of(context).orientation ==
                                        Orientation.landscape)
                            ? 200
                            : 0,
                      ),
                      child: SfDataPagerTheme(
                        data: SfDataPagerThemeData(
                          selectedItemColor: primaryColor.shade200,
                          selectedItemTextStyle:
                              const TextStyle(color: Colors.black),
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
                          delegate: dataSource,
                        ),
                      ),
                    ),
                  ],
                )));
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
