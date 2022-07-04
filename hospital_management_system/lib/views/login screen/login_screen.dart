import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '/utilities/constants/responsive.dart';
import '/viewModels/login viewModel/login_viewModel.dart';
import '../main layout/main_layout.dart';
import 'components/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginValue = context.watch<LoginProvider>();
    LoginProvider loginFunction = context.read<LoginProvider>();

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
                    child: SvgPicture.asset(
                      'assets/contents/online-doctor.svg',
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
                          ? SvgPicture.asset(
                              'assets/contents/online-doctor.svg',
                              height: MediaQuery.of(context).size.height * 0.35,
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
