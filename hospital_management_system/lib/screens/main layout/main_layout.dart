import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/dokter%20perawat%20screen/dokterPerawat_screen.dart';
import 'package:hospital_management_system/screens/home%20screen/home_screen.dart';
import 'package:hospital_management_system/screens/pasien%20screen/pasien_screen.dart';
import 'package:hospital_management_system/screens/rawat%20screen/dokter%20perawat%20screen/rawat_screen.dart';

import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    Key? key,
    required this.action,
    this.actionRoute = false,
    required this.child,
    this.keyScreens,
  }) : super(key: key);

  final bool action;
  final bool? actionRoute;
  final Widget child;
  final keyScreens;
  final String assetLogo = 'assets/icons/logo.png';

  List<Widget> route(BuildContext context) {
    if (keyScreens == 'PasienScreen') {
      List<Widget> widgets = [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pop(context),
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
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const RawatScreen())),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DokterPerawatScreen())),
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
            onTap: () => Navigator.pop(context),
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
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PasienScreen())),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DokterPerawatScreen())),
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
            onTap: () => Navigator.pop(context),
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
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PasienScreen())),
          child: const Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const RawatScreen())),
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
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const PasienScreen())),
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
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const RawatScreen())),
          child: const Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DokterPerawatScreen())),
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
          onTap: () => Navigator.pop(context),
          child: const Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Pasien',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Data Rawat Jalan',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DokterPerawatScreen())),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive.isDesktop(context) ||
                Responsive.isTablet(context) &&
                    MediaQuery.of(context).orientation == Orientation.landscape
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: child,
                    ),
                  ),
                ],
              )
            : const Center(
                child: Text(
                  'Not Support :(',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700),
                ),
              ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        height: AppBar().preferredSize.height * 1.3,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 70, top: 5),
                child: GestureDetector(
                  onTap: () {
                    if (keyScreens != 'HomeScreen') {
                      return Navigator.pop(context);
                    } else {
                      return;
                    }
                  },
                  child: Image(
                    width: 150,
                    image: AssetImage(assetLogo),
                  ),
                )),
            action == true
                ? Container(
                    padding: const EdgeInsets.only(right: 60),
                    child: Row(
                      children: [
                        (actionRoute != false)
                            ? Row(
                                children: route(context),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                          width: 70,
                          height: 52,
                          child: Card(
                            color: primaryColor.shade500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 16,
                                  child: ImageIcon(
                                    AssetImage(
                                        'assets/icons/accountCircle.png'),
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
