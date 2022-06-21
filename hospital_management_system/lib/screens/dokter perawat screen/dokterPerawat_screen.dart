import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModels/dokter perawat viewModel/dokterPerawat_provider.dart';
import '/screens/main%20layout/main_layout.dart';
import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';

import 'components/dokterPerawat_table.dart';

class DokterPerawatScreen extends StatelessWidget {
  const DokterPerawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'DokterPerawatScreen',
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
              child: Consumer<DokterPerawatProvider>(
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
              height: 45,
            ),
            DokterPerawatTable().buildTable(context),
          ],
        ),
      ),
    );
  }
}
