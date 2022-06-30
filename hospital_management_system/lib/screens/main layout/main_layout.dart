import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../drawer/drawer.dart';
import '/screens/main%20layout/inRoute.dart';

import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';

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
  bool connected = true;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      if (mounted) {
        setState(() {
          this.connected = connected;
        });
      }
    });

    animationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
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
      endDrawer: (Responsive.isDesktop(context) ||
              Responsive.isTablet(context) &&
                  MediaQuery.of(context).orientation == Orientation.landscape)
          ? null
          : CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            Expanded(
              child:
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
                if (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context) &&
                        MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                  SingleChildScrollView(
                    child: (connected == true)
                        ? widget.child
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text('No Connection'),
                            ),
                          ),
                  )
                else
                  SingleChildScrollView(
                    dragStartBehavior: DragStartBehavior.down,
                    physics: const BouncingScrollPhysics(),
                    child: (connected == true)
                        ? widget.child
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text('No Connection'),
                            ),
                          ),
                  ),
                Positioned(
                  right: 70,
                  top: 5,
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: const ShapedWidget(),
                  ),
                ),
                Builder(builder: (context) {
                  if (connected == true) {
                    Future.delayed(const Duration(seconds: 2), () {
                      if (mounted) {
                        setState(() {
                          _isVisible = false;
                        });
                      }
                    });
                  } else {
                    _isVisible = true;
                  }
                  return Visibility(
                    visible: _isVisible,
                    child: Positioned(
                      left: 0.0,
                      right: 0.0,
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color:
                            connected ? Colors.green : const Color(0xFFEE4400),
                        child: connected
                            ? const Center(
                                child: Text(
                                  'Connected',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Connecting',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  SizedBox(
                                    width: 12,
                                    height: 12,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                }),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        height: (Responsive.isDesktop(context) || Responsive.isTablet(context))
            ? AppBar().preferredSize.height * 1.3
            : AppBar().preferredSize.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: (Responsive.isDesktop(context) ||
                            Responsive.isTablet(context) &&
                                MediaQuery.of(context).orientation ==
                                    Orientation.landscape)
                        ? 70
                        : 20,
                    top: 5),
                child: GestureDetector(
                  onTap: () {
                    if (widget.keyScreens != 'HomeScreen') {
                      Navigator.popAndPushNamed(context, '/home');
                    } else {
                      return;
                    }
                  },
                  child: Image(
                    width: (Responsive.isDesktop(context) ||
                            Responsive.isTablet(context))
                        ? 140
                        : MediaQuery.of(context).size.width * 0.2,
                    image: AssetImage(assetLogo),
                  ),
                )),
            widget.action == true &&
                        connected == true &&
                        Responsive.isDesktop(context) ||
                    Responsive.isTablet(context) &&
                        MediaQuery.of(context).orientation ==
                            Orientation.landscape
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
                                  child: (_menuShown == false)
                                      ? const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.keyboard_arrow_up,
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
                : widget.action == true && connected == true
                    ? Container(
                        padding: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 30,
                        child: Builder(
                          builder: (context) => InkWell(
                            borderRadius: BorderRadius.circular(50),
                            child: const Icon(Icons.menu),
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
