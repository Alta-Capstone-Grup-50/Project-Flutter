import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '/utilities/constants/responsive.dart';
import '/viewModels/login viewModel/login_viewModel.dart';
import '../main layout/main_layout.dart';
import 'components/login_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final List<String> imgList = [
    'assets/contents/online-doctor.svg',
    'assets/contents/online-doctor2.svg',
    'assets/contents/online-doctor3.svg',
    'assets/contents/online-doctor4.svg',
    'assets/contents/online-doctor5.svg',
    'assets/contents/online-doctor6.svg',
  ];

  @override
  Widget build(BuildContext context) {
    LoginProvider loginValue = context.watch<LoginProvider>();

    return MainLayout(
      action: false,
      keyScreens: 'login',
      child: Column(
        children: [
          loginValue.loggedInStatusAuth == StatusAuth.authenticating
              ? const LinearProgressIndicator()
              : const SizedBox.shrink(),
          if (Responsive.isDesktop(context) ||
              Responsive.isTablet(context) &&
                  MediaQuery.of(context).orientation == Orientation.landscape)
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: LoginView()),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: CarouselSlider.builder(
                        itemCount: imgList.length,
                        autoSliderTransitionCurve: Curves.fastOutSlowIn,
                        slideTransform: const DepthTransform(),
                        slideBuilder: (index) {
                          return SvgPicture.asset(
                            imgList[index],
                          );
                        },
                        enableAutoSlider: true,
                        unlimitedMode: true,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: (!Responsive.isMobile(context))
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: CarouselSlider.builder(
                                itemCount: imgList.length,
                                autoSliderTransitionCurve: Curves.fastOutSlowIn,
                                slideBuilder: (index) {
                                  return SvgPicture.asset(
                                    imgList[index],
                                  );
                                },
                                enableAutoSlider: true,
                                unlimitedMode: true,
                              ),
                            )
                          : const SizedBox.shrink()),
                  Padding(
                    padding: EdgeInsets.only(
                      top: (!Responsive.isMobile(context))
                          ? 0
                          : MediaQuery.of(context).size.height * 0.1,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: const LoginView(),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
