import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/manage_data_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../utilities/constants/responsive.dart';
import '../../../viewModels/manage viewModel/manage_viewModel.dart';
import '/utilities/constants/color.dart';
import 'dataManage_source_table.dart';
import 'detailData_manage.dart';

class ManageAccountTable {
  Widget buildTable(BuildContext context) {
    return Consumer<ManageViewModel>(builder: (context, value, _) {
      if (value.fetchStatusManage == StatusFetchManage.isLoading) {
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
      } else if (value.fetchStatusManage == StatusFetchManage.letsGo) {
        List<DataManage> val;

        if (value.search.isNotEmpty || value.searchController.text.isNotEmpty) {
          val = value.search;
        } else {
          val = value.listManageData;
        }
        final ManageDataSourceTable dataSource =
            ManageDataSourceTable(val, context);

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
                            : 300,
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        sortIconColor: Colors.black,
                        headerHoverColor: grey.shade100,
                        headerColor: grey.shade100,
                        rowHoverColor: green.shade300,
                      ),
                      child: Stack(children: [
                        SfDataGrid(
                          key: value.keyManage,
                          isScrollbarAlwaysShown: true,
                          rowHeight: 40,
                          allowPullToRefresh: true,
                          source: dataSource,
                          columnWidthMode: ColumnWidthMode.fill,
                          onCellTap: (query) {
                            if (query.rowColumnIndex.rowIndex > 0) {
                              openDetailManage(
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
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              label: Container(
                                padding: const EdgeInsets.only(right: 16),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'SIP/SIPP',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              width: 210,
                              columnName: 'Nama',
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
                              width: 160,
                              columnName: 'Jenis Kelamin',
                              label: Container(
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
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              columnName: 'Email',
                              label: Container(
                                padding: const EdgeInsets.only(right: 16),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Email',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            GridColumn(
                              columnWidthMode: ColumnWidthMode.lastColumnFill,
                              columnName: 'Password',
                              label: Container(
                                padding: const EdgeInsets.only(right: 16),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Password',
                                  style: TextStyle(fontWeight: FontWeight.w700),
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
