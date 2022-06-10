import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main layout/main_layout.dart';

import 'components/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        action: false,
        child: Row(
          children: [
            const Expanded(child: LoginView()),
            Expanded(child: content()),
          ],
        ));
  }

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(top: 120),
      child: SvgPicture.asset('assets/contents/online-doctor.svg'),
    );
  }
}
