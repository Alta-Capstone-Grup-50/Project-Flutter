import 'package:flutter/material.dart';

class InRoute {
  List<Widget> route(BuildContext context, String keyScreens) {
    if (keyScreens == 'PasienScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/home')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/rawatJalan', ModalRoute.withName('/rawatJalan')),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(context,
                '/tenagaKesehatan', ModalRoute.withName('/tenagaKesehatan')),
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
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/home')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/pasien', ModalRoute.withName('/pasien')),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(context,
                '/tenagaKesehatan', ModalRoute.withName('/tenagaKesehatan')),
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
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/home')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/pasien', ModalRoute.withName('/pasien')),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/rawatJalan', ModalRoute.withName('/rawatJalan')),
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
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/pasien', ModalRoute.withName('/pasien')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/rawatJalan', ModalRoute.withName('/rawatJalan')),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(context,
                '/tenagaKesehatan', ModalRoute.withName('/tenagaKesehatan')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/home', ModalRoute.withName('/home')),
          child: const Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(
                context, '/pasien', ModalRoute.withName('/pasien')),
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
          onTap: () async => await Navigator.pushNamedAndRemoveUntil(
              context, '/rawatJalan', ModalRoute.withName('/rawatJalan')),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () async => await Navigator.pushNamedAndRemoveUntil(context,
                '/tenagaKesehatan', ModalRoute.withName('/tenagaKesehatan')),
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
