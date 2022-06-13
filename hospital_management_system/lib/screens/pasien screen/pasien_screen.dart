import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/main%20layout/main_layout.dart';

class PasienScreen extends StatelessWidget {
  const PasienScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
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
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Data Pasien',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
