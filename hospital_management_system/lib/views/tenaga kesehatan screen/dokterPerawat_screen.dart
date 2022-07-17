import 'package:flutter/material.dart';

import '../../utilities/constants/responsive.dart';
import '/views/main%20layout/main_layout.dart';

import 'components/chose_card.dart';

class TenagaKesehatanScreen extends StatelessWidget {
  const TenagaKesehatanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      actionRoute: true,
      action: true,
      keyScreens: 'DokterPerawatScreen',
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
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/home', ModalRoute.withName('/home')),
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text(
                  "Dokter dan Perawat",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.15
                    : (Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                        ? 70
                        : 20,
                vertical: 25),
            child: Column(
              crossAxisAlignment: (!Responsive.isMobile(context))
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (!Responsive.isMobile(context)) ? 53.5 : 40,
                      bottom: (!Responsive.isMobile(context)) ? 53 : 40),
                  child: const Text(
                    'Data Tenaga Kesehatan',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                ),
                (!Responsive.isMobile(context))
                    ? Column(
                        children: [
                          Row(
                            children: [
                              ChoseCard(
                                title: 'Data Dokter',
                                image: 'assets/contents/data_dokter.png',
                                page: '/tenagaKesehatan/dokter',
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ChoseCard(
                                title: 'Data Perawat',
                                image: 'assets/contents/data_perawat.png',
                                page: '/tenagaKesehatan/perawat',
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChoseCard(
                            title: 'Data Dokter',
                            image: 'assets/contents/data_dokter.png',
                            page: '/tenagaKesehatan/dokter',
                          ),
                          ChoseCard(
                            title: 'Data Perawat',
                            image: 'assets/contents/data_perawat.png',
                            page: '/tenagaKesehatan/perawat',
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
