import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModels/main layout viewModel/mainLayout_viewModel.dart';
import '../drawer/drawer.dart';
import '/Views/main%20layout/inRoute.dart';

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

  final String assetLogo = 'assets/icons/logo.png';

  @override
  void initState() {
    super.initState();

    final mainProvider = context.read<MainLayoutProvider>();
    mainProvider.checkConnection();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final provideValue = context.watch<MainLayoutProvider>();
    final provideFunction = context.read<MainLayoutProvider>();

    if (provideValue.connected == true) {
      Future.delayed(const Duration(seconds: 2), () async {
        provideFunction.changeVisible(false);
      });
    } else {
      Future.delayed(Duration.zero, () async {
        provideFunction.changeVisible(true);
      });
    }

    return Scaffold(
      endDrawer: (Responsive.isDesktop(context) ||
              Responsive.isTablet(context) &&
                  MediaQuery.of(context).orientation == Orientation.landscape)
          ? null
          : widget.keyScreens == 'login'
              ? null
              : CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context, provideValue, provideFunction),
            body(context, provideValue, provideFunction),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context, MainLayoutProvider provideValue,
      MainLayoutProvider provideFunction) {
    return Material(
      elevation: 5,
      child: Container(
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
                onTap: () async {
                  if (widget.keyScreens != 'HomeScreen' &&
                      widget.keyScreens != 'login') {
                    await Navigator.pushNamedAndRemoveUntil(
                        context, '/home', ModalRoute.withName('/home'));
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
                                    child: (provideValue.menuShown == false)
                                        ? const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.keyboard_arrow_up,
                                            color: Colors.white,
                                          ),
                                    onTap: () {
                                      provideFunction.changeMenuShown();
                                    },
                                  ),
                                ],
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
    Animation<double> opacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    if (provideValue.menuShown) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
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
        Positioned(
          right: 70,
          top: 5,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: const ShapedWidget(),
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
}
