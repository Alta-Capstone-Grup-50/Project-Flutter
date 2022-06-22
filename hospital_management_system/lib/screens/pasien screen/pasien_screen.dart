import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:hospital_management_system/screens/pasien%20screen/components/pasien_table.dart';
import 'package:provider/provider.dart';

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
      actionRoute: true,
      keyScreens: 'PasienScreen',
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
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Data Pasien',
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
            Consumer<PasienProvider>(builder: ((context, valueProvider, _) {
              if (Theme.of(context).platform == TargetPlatform.windows ||
                  kIsWeb) {
                return Row(children: [
                  SizedBox(
                      width: 391,
                      height: 40,
                      child: Input(
                        controller: valueProvider.searchController,
                        onChanged: valueProvider.onSearch,
                        hintText: 'Cari di sini',
                        backgroundColor: const Color(0xFFEBEBEB),
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                      )),
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
                          valueProvider.keyPasien.currentState!.refresh();
                        },
                      ),
                    ),
                  ),
                ]);
              } else {
                return SizedBox(
                    width: 391,
                    height: 40,
                    child: Input(
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
            })),
            const SizedBox(
              height: 20,
            ),
            PasienTable().buildTable(context),
          ],
        ),
      ),
    );
  }
}
