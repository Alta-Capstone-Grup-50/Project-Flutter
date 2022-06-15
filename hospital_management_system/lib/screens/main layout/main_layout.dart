import 'package:flutter/material.dart';

import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.action, required this.child})
      : super(key: key);

  final bool action;
  final Widget child;

  final String assetLogo = 'assets/icons/logo.png';

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
                  child,
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
                child: Image(
                  width: 150,
                  image: AssetImage(assetLogo),
                )),
            action == true
                ? Container(
                    padding: const EdgeInsets.only(right: 60),
                    child: MaterialButton(
                        highlightElevation: 0,
                        focusElevation: 0,
                        elevation: 0,
                        height: 50,
                        minWidth: maxWidth / 9.5,
                        color: primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        onPressed: () {},
                        child: Row(
                          children: [],
                        )),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
