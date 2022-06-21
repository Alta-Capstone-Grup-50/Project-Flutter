import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/rawat%20screen/dokter%20perawat%20screen/components/rawat_table.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../viewModels/pasien viewModel/pasien_provider.dart';
import '../../../viewModels/rawat viewModel/rawat_provider.dart';
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
      actionRoute: true,
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
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Data Pasien Rawat Jalan',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 391,
              height: 40,
              child: Consumer<RawatProvider>(
                builder: ((context, valueProvider, _) => Input(
                      hintText: 'Cari di sini',
                      controller: valueProvider.searchController,
                      onChanged: valueProvider.onSearch,
                      backgroundColor: const Color(0xFFEBEBEB),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RawatTable().buildTable(context),
          ],
        ),
      ),
    );
  }
}
