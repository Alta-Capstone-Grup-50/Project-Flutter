import 'package:flutter/material.dart';

import '/views/main%20layout/main_layout.dart';

import 'components/chose_card.dart';
import 'dokter dan perawat/dokter_screen.dart';
import 'dokter dan perawat/perawat_screen.dart';

class TenagaKesehatanScreen extends StatelessWidget {
  const TenagaKesehatanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      actionRoute: true,
      action: true,
      keyScreens: 'DokterPerawatScreen',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoseCard(
                title: 'Data Dokter',
                image: 'assets/contents/data_dokter.png',
                page: const DokterScreen(),
              ),
              const SizedBox(
                width: 20,
              ),
              ChoseCard(
                title: 'Data Perawat',
                image: 'assets/contents/data_dokter.png',
                page: const PerawatScreen(),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
