import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/home%20screen/components/chose_card.dart';
import 'package:hospital_management_system/screens/home%20screen/components/content.dart';
import 'package:hospital_management_system/screens/main%20layout/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      child: Column(
        children: [
          const SizedBox(
            height: 47,
          ),
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
              children: const [
                ChoseCard(
                    title: 'Data Pasien',
                    openHistory: 'Dibuka pada 2 Juni 2022',
                    image: 'assets/contents/data_pasien.png'),
                SizedBox(
                  width: 20,
                ),
                ChoseCard(
                    title: 'Data Dokter dan Perawat',
                    openHistory: 'Dibuka pada 13 Mei 2022',
                    image: 'assets/contents/data_dokter.png'),
                SizedBox(
                  width: 20,
                ),
                ChoseCard(
                    title: 'Data Rawat Jalan',
                    openHistory: 'Dibuka pada 2 Juni 2022',
                    image: 'assets/contents/data_rawat.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
