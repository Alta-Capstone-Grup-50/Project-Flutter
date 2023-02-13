import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import '../../../viewModels/pasien_viewModel/pasien_viewModel.dart';

import 'data_source_table.dart';

import '/views/pasien%20screen/components/detailPasien.dart';

class PasienTable {
  Widget buildTable(BuildContext context) {
    return Consumer<PasienViewModel>(builder: (context, value, _) {
      if (value.fetchStatusPasien == StatusFetchPasien.isLoading) {
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
      } else if (value.fetchStatusPasien == StatusFetchPasien.letsGo) {
        List<PasienModel> val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listPasienData;
        }
        final PasienDataSourceTable dataSource =
            PasienDataSourceTable(val, context);

        double countPage;
        if (dataSource.data.isEmpty) {
          countPage = 1;
        } else {
          countPage = dataSource.data.length / dataSource.rowsPerPage;
        }

        double countPageOfSearch = value.search.length / dataSource.rowsPerPage;

        return LayoutBuilder(
          builder: ((context, constraints) => Column(children: [
                SizedBox(
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
                    child: Stack(
                      children: [
                        SfDataGrid(
                            key: value.keyPasien,
                            source: dataSource,
                            rowHeight: 40,
                            allowPullToRefresh: true,
                            isScrollbarAlwaysShown: true,
                            columnWidthMode: ColumnWidthMode.fill,
                            onCellTap: (query) {
                              if (query.rowColumnIndex.rowIndex > 0) {
                                openDetailPasien(
                                    context, query, dataSource.startIndex);
                              } else {
                                return;
                              }
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
                                  width: 150,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Nama',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Jenis Kelamin',
                                  width: 150,
                                  label: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Jenis Kelamin',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Alamat',
                                  width: 250,
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: const Text(
                                        'Alamat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  columnName: 'Poli',
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          right: 16.0, left: 20.0),
                                      child: const Text(
                                        'Poli',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                              GridColumn(
                                  width: 140,
                                  columnName: 'Nomor Telepon',
                                  label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Nomor Telepon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      )))
                            ]),
                        (dataSource.data.isEmpty)
                            ? const Center(child: Text('Data Kosong'))
                            : const SizedBox.shrink(),
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
                        )))
              ])),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
