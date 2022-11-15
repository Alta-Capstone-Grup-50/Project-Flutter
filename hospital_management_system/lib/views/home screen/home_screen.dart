import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/utilities/constants/responsive.dart';
import '/Views/home%20screen/components/chose_card.dart';
import '/Views/home%20screen/components/content.dart';
import '/Views/main%20layout/main_layout.dart';
import '/viewModels/home viewModel/home_viewModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueProvider = context.watch<HomeProvider>();

    return MainLayout(
      action: true,
      keyScreens: 'HomeScreen',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.1
                      : (Responsive.isTablet(context) &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.landscape)
                          ? 70
                          : 20,
                  vertical: 16),
              child: Text(
                'Info Terkini',
                style: TextStyle(
                    fontSize: (Responsive.isMobile(context)) ? 22 : 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Content(),
            const SizedBox(
              height: 35,
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
                ),
                child: (!Responsive.isMobile(context))
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChoseCard(
                            title: 'Data Pasien',
                            openHistory:
                                valueProvider.lastOpenDataPasien ?? '...',
                            image: 'assets/contents/data_pasien.png',
                            page: '/pasien',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ChoseCard(
                            title: 'Data Tenaga Kesehatan',
                            openHistory:
                                valueProvider.lastOpenDataDokterPerawat ??
                                    '...',
                            image: 'assets/contents/data_perawat.png',
                            page: '/tenagaKesehatan',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ChoseCard(
                            title: 'Data Pasien Rawat Jalan',
                            openHistory:
                                valueProvider.lastOpenDataRawatJalan ?? '...',
                            image: 'assets/contents/data_rawat.png',
                            page: '/rawatJalan',
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih Data',
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isMobile(context)) ? 22 : 28,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            ChoseCard(
                              title: 'Data Pasien',
                              openHistory:
                                  valueProvider.lastOpenDataPasien ?? '...',
                              image: 'assets/contents/data_pasien.png',
                              page: '/pasien',
                            ),
                            ChoseCard(
                              title: 'Data Tenaga Kesehatan',
                              openHistory:
                                  valueProvider.lastOpenDataDokterPerawat ??
                                      '...',
                              image: 'assets/contents/data_perawat.png',
                              page: '/tenagaKesehatan',
                            ),
                            ChoseCard(
                              title: 'Data Pasien Rawat Jalan',
                              openHistory:
                                  valueProvider.lastOpenDataRawatJalan ?? '...',
                              image: 'assets/contents/data_rawat.png',
                              page: '/rawatJalan',
                            ),
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
