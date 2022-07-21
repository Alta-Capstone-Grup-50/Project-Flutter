import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utilities/common/case_dialog.dart';
import '../../viewModels/login viewModel/login_viewModel.dart';
import '../../viewModels/main layout viewModel/mainLayout_viewModel.dart';
import '../drawer/drawer.dart';
import '/Views/main%20layout/inRoute.dart';

import '/utilities/constants/responsive.dart';

class MainLayout extends StatefulWidget {
  MainLayout({
    Key? key,
    required this.action,
    this.actionRoute = false,
    required this.child,
    this.keyScreens,
  }) : super(key: key);

  bool action;
  final bool? actionRoute;
  final Widget child;
  final keyScreens;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with WidgetsBindingObserver {
  final String assetLogo = 'assets/icons/logo.png';

  void handleUserInteraction([_]) {
    if (widget.keyScreens != 'login') {
      final loginValue = context.read<LoginProvider>();
      loginValue.autologout(context);
    }
  }

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addObserver(this);

    final mainProvider = context.read<MainLayoutProvider>();
    mainProvider.checkConnection();

    if (widget.keyScreens != 'login') {
      final loginFunction = context.read<LoginProvider>();

      loginFunction.autologout(context);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  // }

  @override
  Widget build(BuildContext context) {
    final provideValue = context.watch<MainLayoutProvider>();
    final provideFunction = context.read<MainLayoutProvider>();
    final loginFunction = context.read<LoginProvider>();

    if (provideValue.connected == true) {
      Future.delayed(const Duration(seconds: 2), () async {
        provideFunction.changeVisible(false);
      });
    } else {
      Future.delayed(Duration.zero, () async {
        provideFunction.changeVisible(true);
      });
    }

    if (provideValue.connected == false) {
      widget.action = false;
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: handleUserInteraction,
      onPointerMove: handleUserInteraction,
      onPointerUp: handleUserInteraction,
      onPointerSignal: handleUserInteraction,
      onPointerHover: handleUserInteraction,
      child: Scaffold(
        endDrawer: (Responsive.isDesktop(context) ||
                Responsive.isTablet(context) &&
                    MediaQuery.of(context).orientation == Orientation.landscape)
            ? null
            : widget.keyScreens == 'login'
                ? null
                : CustomDrawer(
                    keyScreens: widget.keyScreens,
                  ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(context, provideValue, provideFunction),
              body(context, provideValue, provideFunction),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context, MainLayoutProvider provideValue,
      MainLayoutProvider provideFunction) {
    LoginProvider logoutFunction = context.read<LoginProvider>();
    return Material(
      elevation: 5,
      child: SizedBox(
        height: (Responsive.isDesktop(context) || Responsive.isTablet(context))
            ? AppBar().preferredSize.height * 1.3
            : AppBar().preferredSize.height,
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                  if (widget.keyScreens != 'HomeScreen' &&
                      widget.keyScreens != 'login') {
                    Navigator.pop(context);
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
          widget.action == true
              ? (provideValue.connected == true &&
                          Responsive.isDesktop(context) ||
                      Responsive.isTablet(context) &&
                          MediaQuery.of(context).orientation ==
                              Orientation.landscape)
                  ? Container(
                      padding: const EdgeInsets.only(right: 70),
                      child: Row(
                        children: [
                          (widget.actionRoute != false)
                              ? Row(
                                  children: InRoute()
                                      .route(context, widget.keyScreens),
                                )
                              : const SizedBox.shrink(),
                          InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              showCaseDialog(
                                context,
                                title: 'Konfirmasi',
                                label: 'Apakah anda yakin ingin logout?',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  logoutFunction.logout(context);
                                },
                              );
                            },
                            child: SizedBox(
                              width: 110,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 5.0, left: 10),
                                      child: Text(
                                        'Log out',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : widget.action == true && provideValue.connected == true ||
                          Responsive.isDesktop(context) &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.portrait ||
                          Responsive.isMobile(context)
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
              : const SizedBox.shrink()
        ]),
      ),
    );
  }

  Widget body(BuildContext context, MainLayoutProvider provideValue,
      MainLayoutProvider provideFunction) {
    return Expanded(
      child: Stack(alignment: AlignmentDirectional.topCenter, children: [
        if (Responsive.isDesktop(context) ||
            Responsive.isTablet(context) &&
                MediaQuery.of(context).orientation == Orientation.landscape)
          SingleChildScrollView(
            child: (provideValue.connected == true)
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
            child: (provideValue.connected == true)
                ? widget.child
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('No Connection'),
                    ),
                  ),
          ),
        Visibility(
          visible: provideValue.isVisible,
          child: Positioned(
            left: 0.0,
            right: 0.0,
            height: MediaQuery.of(context).size.height * 0.035,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: provideValue.connected
                  ? Colors.green
                  : const Color(0xFFEE4400),
              child: provideValue.connected
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ]),
    );
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   switch (state) {
  //     case AppLifecycleState.inactive:
  //       print('appLifeCycleState inactive');

  //       if (widget.keyScreens != 'login') {
  //         final loginFunction = context.read<LoginProvider>();

  //         loginFunction.autologout(context);
  //       }
  //       final mainProvider = context.read<MainLayoutProvider>();
  //       mainProvider.stopConnection();
  //       break;
  //     case AppLifecycleState.resumed:
  //       print('appLifeCycleState resumed');
  //       if (widget.keyScreens != 'login') {
  //         final loginFunction = context.read<LoginProvider>();

  //         loginFunction.autologout(context);
  //       }
  //       final mainProvider = context.read<MainLayoutProvider>();
  //       mainProvider.checkConnection();
  //       break;
  //     case AppLifecycleState.paused:
  //       print('appLifeCycleState paused');
  //       if (widget.keyScreens != 'login') {
  //         final loginFunction = context.read<LoginProvider>();

  //         loginFunction.autologout(context);
  //       }
  //       break;
  //     case AppLifecycleState.detached:
  //       print('appLifeCycleState suspending');
  //       if (widget.keyScreens != 'login') {
  //         final loginFunction = context.read<LoginProvider>();

  //         loginFunction.autologout(context);
  //       }
  //       final mainProvider = context.read<MainLayoutProvider>();
  //       mainProvider.stopConnection();
  //       break;
  //   }
  // }
}
