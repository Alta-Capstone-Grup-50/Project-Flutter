import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/home%20screen/components/chose_card.dart';
import 'package:hospital_management_system/screens/home%20screen/components/content.dart';
import 'package:hospital_management_system/screens/main%20layout/main_layout.dart';
import 'package:hospital_management_system/screens/rawat%20screen/dokter%20perawat%20screen/rawat_screen.dart';

import '../dokter perawat screen/dokterPerawat_screen.dart';
import '../pasien screen/pasien_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 47),
        child: Column(
          children: [
            const Content(),
            const SizedBox(
              height: 50,
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
                    openHistory: 'Dibuka pada 2 Juni 2022',
                    image: 'assets/contents/data_pasien.png',
                    page: const PasienScreen(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoseCard(
                    title: 'Data Dokter dan Perawat',
                    openHistory: 'Dibuka pada 13 Mei 2022',
                    image: 'assets/contents/data_dokter.png',
                    page: const DokterPerawatScreen(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoseCard(
                    title: 'Data Rawat Jalan',
                    openHistory: 'Dibuka pada 2 Juni 2022',
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
