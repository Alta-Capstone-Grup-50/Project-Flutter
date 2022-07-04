import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '/viewModels/dokter perawat viewModel/dokterPerawat_viewModel.dart';
import '../components/perawat_table.dart';
import '/views/main%20layout/main_layout.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';

class PerawatScreen extends StatelessWidget {
  const PerawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'PerawatScreen',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, '/tenagaKesehatan'),
                  child: const Text(
                    "Dokter dan Perawat > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data Perawat"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Data Perawat',
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
            Consumer<DokterPerawatProvider>(
              builder: ((context, valueProvider, _) {
                if (Theme.of(context).platform == TargetPlatform.windows ||
                    kIsWeb) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 391,
                        height: 40,
                        child: Input(
                          hintText: 'Cari di sini',
                          controller: valueProvider.searchController,
                          onChanged: valueProvider.onSearch,
                          backgroundColor: const Color(0xFFEBEBEB),
                          prefixIcon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          color: primaryColor.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            onTap: () {
                              valueProvider.keyDokterPerawat.currentState!
                                  .refresh();
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                      width: 391,
                      height: 40,
                      child: Input(
                        textInputAction: TextInputAction.done,
                        controller: valueProvider.searchController,
                        onChanged: valueProvider.onSearch,
                        hintText: 'Cari di sini',
                        backgroundColor: const Color(0xFFEBEBEB),
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                      ));
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            PerawatTable().buildTable(context),
          ],
        ),
      ),
    );
  }
}
