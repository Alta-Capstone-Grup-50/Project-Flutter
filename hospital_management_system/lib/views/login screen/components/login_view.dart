import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/services/perfs_service.dart';
import '/utilities/constants/validate.dart';
import '/utilities/constants/responsive.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';

import '/viewModels/login viewModel/login_viewModel.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginValue = context.watch<LoginProvider>();
    LoginProvider loginFunction = context.read<LoginProvider>();

    if (loginValue.checkBox == false) {
      UserPreferences().removeDetailLogin();
    }

    if (Responsive.isDesktop(context) ||
        Responsive.isTablet(context) &&
            MediaQuery.of(context).orientation == Orientation.landscape) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: (Responsive.isMobile(context)) ? 20 : 56,
              right: (Responsive.isMobile(context)) ? 20 : 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: rocketMetalic),
              ),
              Text(
                'Welcome back! Please enter your details.',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: rocketMetalic),
              ),
              const SizedBox(
                height: 45,
              ),
              formField(loginValue, loginFunction, context),
              const SizedBox(
                height: 35,
              ),
              buttonField(loginValue, loginFunction, context),
              const SizedBox(
                height: 5,
              ),
              anotherButton(loginValue, loginFunction, context),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          left: (Responsive.isMobile(context))
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.width * 0.08,
          right: (Responsive.isMobile(context))
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.width * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome Back',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('Welcome back! Please enter your details.',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 45,
            ),
            formField(loginValue, loginFunction, context),
            SizedBox(
              height: (Responsive.isMobile(context)) ? 20 : 35,
            ),
            buttonField(loginValue, loginFunction, context),
            const SizedBox(
              height: 5,
            ),
            anotherButton(loginValue, loginFunction, context),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }
  }

  Widget formField(LoginProvider loginValue, LoginProvider loginFunction,
      BuildContext context) {
    return Form(
      key: loginFunction.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email :',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 12,
          ),
          Input(
            controller: loginValue.usernameController,
            hintText: 'Masukan username kamu',
            maxLines: 1,
            textInputAction: TextInputAction.next,
            onSaved: (value) {},
            validator: (value) {
              return validateEmail(value!);
            },
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            'Password :',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 12,
          ),
          Input(
              controller: loginValue.passwordController,
              hintText: 'Masukan password kamu',
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: loginValue.obscure ? true : false,
              onSaved: (value) {},
              validator: (value) {
                return validatePassword(value!);
              },
              suffixIcon: IconButton(
                splashRadius: 21,
                icon: loginValue.obscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  loginFunction.functionObscure();
                },
              )),
        ],
      ),
    );
  }

  Widget buttonField(LoginProvider buttonValue, LoginProvider buttonFunction,
      BuildContext context) {
    return AbsorbPointer(
      absorbing: buttonValue.loggedInStatusAuth != StatusAuth.authenticating
          ? false
          : true,
      child: MaterialButton(
        minWidth: double.infinity,
        height: (Responsive.isMobile(context)) ? 40 : 60,
        color: buttonValue.loggedInStatusAuth != StatusAuth.authenticating
            ? primaryColor
            : grey.shade300,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: buttonValue.loggedInStatusAuth != StatusAuth.authenticating
            ? () {
                FocusManager.instance.primaryFocus?.unfocus();
                buttonFunction.login(context);
              }
            : () {
                return;
              },
        child: FittedBox(
          child: buttonValue.loggedInStatusAuth != StatusAuth.authenticating
              ? const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : const Text(
                  'Loading..',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  Widget anotherButton(LoginProvider anotherValue,
      LoginProvider anotherFunction, BuildContext context) {
    if (anotherValue.checkBox == false) {
      UserPreferences().removeDetailLogin();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: (Responsive.isMobile(context)) ? 170 : 164,
          child: CheckboxListTile(
            contentPadding: const EdgeInsets.only(right: 20),
            title: Text(
              'Remember me',
              style: TextStyle(
                color: rocketMetalic,
                fontSize: 14,
              ),
            ),
            value: anotherValue.checkBox,
            onChanged: (_) {
              anotherFunction.functionCheckBox();
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: primaryColor),
          ),
        )
      ],
    );
  }
}
