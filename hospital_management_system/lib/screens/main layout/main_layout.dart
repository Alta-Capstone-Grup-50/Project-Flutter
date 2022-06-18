import 'package:flutter/material.dart';

import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {Key? key, required this.action, required this.child, this.screens})
      : super(key: key);

  final bool action;
  final Widget child;
  final screens;
  final String assetLogo = 'assets/icons/logo.png';

  List<Widget> screen() {
    if (screens == 'PasienScreen') {
      List<Widget> widgets = [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Data Rawat Jalan',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Tenaga Kesehatan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ];
      return widgets;
    } else if (screens == 'RawatScreen') {
      List<Widget> widgets = [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Data Pasien',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Tenaga Kesehatan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ];
      return widgets;
    } else if (screens == 'DokterPerawatScreen') {
      List<Widget> widgets = [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Data Pasien',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Rawat Jalan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ];
      return widgets;
    } else if (screens == 'HomeScreen') {
      List<Widget> widgets = [
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Tenaga Kesehatan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ];
      return widgets;
    } else {
      List<Widget> widgets = [
        const Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Data Tenaga Kesehatan',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
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
                    Navigator.pop(context);
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
                        Row(
                          children: screen(),
                        ),
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
