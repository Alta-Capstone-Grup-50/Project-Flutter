import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../viewModels/login viewModel/login_provider.dart';
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
        child: Column(
          children: [
            loginValue.loggedInStatus == Status.authenticating
                ? const LinearProgressIndicator()
                : const SizedBox.shrink(),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: LoginView()),
                  Expanded(child: content()),
                ],
              ),
            ),
          ],
        ));
  }

  Widget content() {
    return SvgPicture.asset('assets/contents/online-doctor.svg');
  }
}
