import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:provider/provider.dart';

import '../../../viewModels/login viewModel/login_viewModel.dart';
import '../../../viewModels/rawatJalan viewModel/rawatJalan_viewModel.dart';
import '/views/main%20layout/main_layout.dart';
import '/views/rawat%20screen/dokter%20perawat%20screen/components/rawat_table.dart';

import '/utilities/constants/responsive.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';

class RawatScreen extends StatelessWidget {
  const RawatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider valueProvide = context.watch<LoginProvider>();

    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'RawatScreen',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                    ? 70
                    : 20,
                top: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data pasien rawat jalan"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.1
                    : (Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                        ? 70
                        : 20,
                vertical: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Consumer<RawatJalanViewModel>(
                  builder: ((context, valueProvider, _) {
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
                        (Responsive.isMobile(context))
                            ? const SizedBox.shrink()
                            : SizedBox(
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
                                      if (valueProvider.fetchStatusRawat ==
                                              StatusFetchRawat.isLoading ||
                                          valueProvider.fetchStatusRawat ==
                                              StatusFetchRawat.idle) {
                                        null;
                                      }
                                      if (valueProvider.fetchStatusRawat ==
                                          StatusFetchRawat.letsGo) {
                                        valueProvider.keyRawat.currentState!
                                            .refresh();
                                      }
                                    },
                                  ),
                                ),
                              ),
                        const Spacer(),
                        (valueProvide.result['role'] == 'Dokter' ||
                                valueProvide.result['role'] == 'Perawat')
                            ? SizedBox(
                                height: 65,
                                child: Card(
                                  color: primaryColor.shade600,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueProvider.noAntrian ?? 'Done',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Poli : ${valueProvider.hasMatchPoli ?? '-'}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                      ]);
                    } else {
                      return Row(
                        children: [
                          (Responsive.isDesktop(context) ||
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
                                  ),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
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
                                  ),
                                ),
                          const Spacer(),
                          (valueProvide.result['role'] == 'Dokter' ||
                                  valueProvide.result['role'] == 'Perawat')
                              ? SizedBox(
                                  height: 50,
                                  child: Card(
                                    color: primaryColor.shade600,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueProvider.noAntrian ?? 'Done',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Poli : ${valueProvider.hasMatchPoli ?? '-'}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      );
                    }
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                RawatTable().buildTable(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
