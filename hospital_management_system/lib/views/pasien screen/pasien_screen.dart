import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModels/pasien viewModel/pasien_viewModel.dart';
import '/utilities/constants/responsive.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';

import '/views/pasien%20screen/components/pasien_table.dart';
import '/views/main%20layout/main_layout.dart';

class PasienScreen extends StatelessWidget {
  const PasienScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasienViewModel init = context.read<PasienViewModel>();
    init.getDataApiPasien();

    log('REBUILD');
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'PasienScreen',
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
                  onTap: () async {
                    await Navigator.pushNamedAndRemoveUntil(
                        context, '/home', ModalRoute.withName('/home'));
                  },
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data Pasien"),
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
                vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Data Pasien',
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
                      ? 30
                      : 20,
                ),
                Consumer<PasienViewModel>(
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
                              if (valueProvider.fetchStatusPasien ==
                                      StatusFetchPasien.isLoading ||
                                  valueProvider.fetchStatusPasien ==
                                      StatusFetchPasien.idle) {
                                null;
                              }
                              if (valueProvider.fetchStatusPasien ==
                                  StatusFetchPasien.letsGo) {
                                valueProvider.keyPasien.currentState!.refresh();
                              }
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
                              controller: valueProvider.searchController,
                              onChanged: valueProvider.onSearch,
                              textInputAction: TextInputAction.done,
                              hintText: 'Cari di sini',
                              backgroundColor: const Color(0xFFEBEBEB),
                              prefixIcon: Icon(
                                Icons.search,
                                color: primaryColor,
                              ),
                            ))
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
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
                PasienTable().buildTable(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
