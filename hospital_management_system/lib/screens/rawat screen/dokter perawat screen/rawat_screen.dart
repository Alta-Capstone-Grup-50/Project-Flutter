import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../viewModels/pasien viewModel/pasien_provider.dart';
import '/screens/main%20layout/main_layout.dart';
import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';
import 'components/data_source_table.dart';

class RawatScreen extends StatelessWidget {
  const RawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      keyScreens: 'RawatScreen',
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
                const Text("Data pasien rawat jalan"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Data Pasien Rawat Jalan',
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
                final DataSourceTable _dataSource =
                    DataSourceTable(value.listPasienData);
                return LayoutBuilder(
                    builder: ((context, constraints) => Row(
                          children: [
                            Column(
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
                                      isScrollbarAlwaysShown: true,
                                      source: _dataSource,
                                      columnWidthMode:
                                          ColumnWidthMode.lastColumnFill,
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
                                          columnName: 'NIK',
                                          label: Container(
                                            color: primaryColor.shade200,
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
                                          columnName: 'Jadwal Rawat Jalan',
                                          label: Container(
                                            color: primaryColor.shade200,
                                            alignment: Alignment.centerLeft,
                                            child: const Text(
                                              'Jadwal Rawat Jalan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        GridColumn(
                                          columnName: 'Nomor Antrian',
                                          label: Container(
                                            color: primaryColor.shade200,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Nomor Antrian',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        GridColumn(
                                          columnName: 'Ket. Rawat Jalan',
                                          label: Container(
                                            color: primaryColor.shade200,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Ket. Rawat Jalan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                      delegate: _dataSource,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )));
              }
            }),
          ],
        ),
      ),
    );
  }
}
