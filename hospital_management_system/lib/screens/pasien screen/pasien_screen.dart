import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/pasien%20screen/components/data_source_table.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../viewModels/pasien viewModel/pasien_provider.dart';
import '/screens/main%20layout/main_layout.dart';
import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';

class PasienScreen extends StatelessWidget {
  const PasienScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      screens: 'PasienScreen',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data Pasien"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Data Pasien',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 391,
              height: 40,
              child: Consumer<PasienProvider>(
                  builder: ((context, valueProvider, child) => Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: valueProvider.formKey,
                        child: Input(
                          controller: valueProvider.searchController,
                          onChanged: valueProvider.onSearch,
                          hintText: 'Cari di sini',
                          backgroundColor: const Color(0xFFEBEBEB),
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                        ),
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<PasienProvider>(builder: (context, value, _) {
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

                if (value.search.isNotEmpty ||
                    value.searchController.text.isNotEmpty) {
                  val = value.search;
                } else {
                  val = value.listPasienData;
                }
                final DataSourceTable _dataSource = DataSourceTable(val);

                double countPage =
                    _dataSource.data.length / _dataSource.rowsPerPage;

                double countPageOfSearch =
                    value.search.length / _dataSource.rowsPerPage;

                print("countPageOfSearch = ${countPageOfSearch}");

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
                                source: _dataSource,
                                rowHeight: 40,
                                allowPullToRefresh: true,
                                isScrollbarAlwaysShown: true,
                                columnWidthMode: ColumnWidthMode.lastColumnFill,
                                columns: [
                                  GridColumn(
                                    columnName: 'No',
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'NIK',
                                    label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'NIK',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'Nama',
                                    label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'Alamat',
                                    label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Alamat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'Nomor Telepon',
                                    label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Nomor Telepon',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'Jenis Penyakit',
                                    label: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Jenis Penyakit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 250),
                            child: SfDataPagerTheme(
                              data: SfDataPagerThemeData(),
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
                      )),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
