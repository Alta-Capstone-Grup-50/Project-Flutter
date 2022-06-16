import 'package:flutter/material.dart';
import 'package:hospital_management_system/view%20model/dokter%20perawat%20provider/dokterPerawat_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/screens/main%20layout/main_layout.dart';
import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';
import 'components/data_source_table.dart';

class DokterPerawatScreen extends StatelessWidget {
  const DokterPerawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      screens: 'DokterPerawatScreen',
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
                const Text("Data Dokter dan Perawat"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Data Dokter dan Perawat',
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
              child: Input(
                hintText: 'Cari di sini',
                backgroundColor: const Color(0xFFEBEBEB),
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Consumer<DokterPerawatProvider>(builder: (context, value, _) {
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
                final DataSourceTable _dataSource =
                    DataSourceTable(value.listDokterData);
                return LayoutBuilder(
                  builder: ((context, constraints) => Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: constraints.maxWidth,
                                child: SfDataGrid(
                                  source: _dataSource,
                                  columnWidthMode: ColumnWidthMode.auto,
                                  columns: [
                                    GridColumn(
                                      columnName: 'No',
                                      label: Container(
                                        color: primaryColor.shade200,
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
                                      columnName: 'SIP/SIPP',
                                      label: Container(
                                        color: primaryColor.shade200,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'SIP/SIPP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    GridColumn(
                                      columnName: 'Jabatan',
                                      label: Container(
                                        color: primaryColor.shade200,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Jabatan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    GridColumn(
                                      columnName: 'Jenis Kelamin',
                                      label: Container(
                                        color: primaryColor.shade200,
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
                                      columnName: 'Nomor Telepon',
                                      label: Container(
                                        color: primaryColor.shade200,
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
                                      columnName: 'Spesialis',
                                      label: Container(
                                        color: primaryColor.shade200,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Spesialis',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    GridColumn(
                                      columnName: 'Jadwal Praktek',
                                      label: Container(
                                        color: primaryColor.shade200,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Jadwal Praktek',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    GridColumn(
                                      columnName: 'STR',
                                      label: Container(
                                        color: primaryColor.shade200,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'STR',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: SfDataPagerTheme(
                                  data: SfDataPagerThemeData(),
                                  child: SfDataPager(
                                      pageCount: _dataSource.data.length /
                                          _dataSource.rowsPerPage,
                                      direction: Axis.horizontal,
                                      onPageNavigationStart: (int pageIndex) {
                                        value.changeLoadingIndicator();
                                      },
                                      delegate: _dataSource,
                                      onPageNavigationEnd: (int pageIndex) {
                                        value.changeLoadingIndicator();
                                      }),
                                ),
                              ),
                            ],
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
