import 'package:flutter/material.dart';

import '../pasien screen/pasien_screen.dart';
import '../rawat screen/dokter perawat screen/rawat_screen.dart';
import '../tenaga kesehatan screen/dokterPerawat_screen.dart';

class InRoute {
  List<Widget> route(BuildContext context, String keyScreens) {
    if (keyScreens == 'PasienScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
            child: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/rawatJalan'),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/tenagaKesehatan'),
            child: const Text(
              'Data Tenaga Kesehatan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ];
      return widgets;
    } else if (keyScreens == 'RawatScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
            child: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/pasien'),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/tenagaKesehatan'),
            child: const Text(
              'Data Tenaga Kesehatan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ];
      return widgets;
    } else if (keyScreens == 'DokterPerawatScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
            child: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/pasien'),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, '/rawatJalan'),
            child: const Text(
              'Data Rawat Jalan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ];
      return widgets;
    } else if (keyScreens == 'HomeScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, '/pasien'),
            child: const Text(
              'Data Pasien',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/rawatJalan'),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/tenagaKesehatan'),
            child: const Text(
              'Data Tenaga Kesehatan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ];
      return widgets;
    } else {
      List<Widget> widgets = [
        InkWell(
          onTap: () => () => Navigator.popAndPushNamed(context, '/home'),
          child: const Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, '/pasien'),
            child: const Text(
              'Data Pasien',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, '/rawatJalan'),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/tenagaKesehatan'),
            child: const Text(
              'Data Tenaga Kesehatan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ];
      return widgets;
    }
  }
}
