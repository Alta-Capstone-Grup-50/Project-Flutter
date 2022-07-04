import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import '/viewModels/rawat viewModel/rawat_viewModel.dart';
import '/views/main%20layout/main_layout.dart';
import '/views/rawat%20screen/dokter%20perawat%20screen/components/rawat_table.dart';

import '/utilities/constants/responsive.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';

class RawatScreen extends StatelessWidget {
  const RawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'RawatScreen',
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context) &&
                        MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                ? 70
                : 20,
            vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await Navigator.pushNamedAndRemoveUntil(
                        context, '/home', ModalRoute.withName('/home'));
                  },
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data pasien rawat jalan"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Data Pasien Rawat Jalan',
                style: TextStyle(
                  fontSize: (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context) &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.landscape)
                      ? 40
                      : 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
            SizedBox(
              height: (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context) &&
                          MediaQuery.of(context).orientation ==
                              Orientation.landscape)
                  ? 40
                  : 25,
            ),
            Consumer<RawatProvider>(builder: ((context, valueProvider, _) {
              if (Theme.of(context).platform == TargetPlatform.windows ||
                  kIsWeb) {
                return Row(children: [
                  (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context) &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.landscape)
                      ? SizedBox(
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
                          ))
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
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
                          valueProvider.isLoading
                              ? null
                              : valueProvider.keyRawat.currentState!.refresh();
                        },
                      ),
                    ),
                  ),
                ]);
              } else {
                return (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                    ? SizedBox(
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
                        ))
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
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
            })),
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
