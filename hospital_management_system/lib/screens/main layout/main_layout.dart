import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/dokter%20perawat%20screen/dokterPerawat_screen.dart';
import 'package:hospital_management_system/screens/main%20layout/inRoute.dart';

import 'package:hospital_management_system/screens/pasien%20screen/pasien_screen.dart';
import 'package:hospital_management_system/screens/rawat%20screen/dokter%20perawat%20screen/rawat_screen.dart';

import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';

import 'dropdown_item.dart';

class MainLayout extends StatefulWidget {
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

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _menuShown = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    super.initState();
  }

  final String assetLogo = 'assets/icons/logo.png';

  @override
  Widget build(BuildContext context) {
    Animation<double> opacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    if (_menuShown) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
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
                    child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          SingleChildScrollView(
                            child: widget.child,
                          ),
                          Positioned(
                            right: 70,
                            top: 5,
                            child: FadeTransition(
                              opacity: opacityAnimation,
                              child: const ShapedWidget(),
                            ),
                          ),
                        ]),
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
                    if (widget.keyScreens != 'HomeScreen') {
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
            widget.action == true
                ? Container(
                    padding: const EdgeInsets.only(right: 70),
                    child: Row(
                      children: [
                        (widget.actionRoute != false)
                            ? Row(
                                children:
                                    InRoute().route(context, widget.keyScreens),
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
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 16,
                                  child: ImageIcon(
                                    AssetImage(
                                        'assets/icons/accountCircle.png'),
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _menuShown = !_menuShown;
                                    });
                                  },
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
