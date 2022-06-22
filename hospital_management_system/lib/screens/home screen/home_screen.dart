import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/home%20screen/components/chose_card.dart';
import '/screens/home%20screen/components/content.dart';
import '/screens/main%20layout/main_layout.dart';
import '/screens/rawat%20screen/dokter%20perawat%20screen/rawat_screen.dart';
import '/viewModels/home%20provider/home_provider.dart';

import '../dokter perawat screen/dokterPerawat_screen.dart';
import '../pasien screen/pasien_screen.dart';

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
              padding: const EdgeInsets.only(left: 70, bottom: 16),
              child: const Text(
                'Info Terkini',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            Content(),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoseCard(
                    title: 'Data Pasien',
                    openHistory: valueProvider.lastOpenDataPasien ?? '...',
                    image: 'assets/contents/data_pasien.png',
                    page: const PasienScreen(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoseCard(
                    title: 'Data Dokter dan Perawat',
                    openHistory:
                        valueProvider.lastOpenDataDokterPerawat ?? '...',
                    image: 'assets/contents/data_dokter.png',
                    page: const DokterPerawatScreen(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoseCard(
                    title: 'Data Pasien Rawat Jalan',
                    openHistory: valueProvider.lastOpenDataRawatJalan ?? '...',
                    image: 'assets/contents/data_rawat.png',
                    page: const RawatScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
