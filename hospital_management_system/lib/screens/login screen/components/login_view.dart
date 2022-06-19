import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/validate.dart';
import 'package:provider/provider.dart';

import '../../../viewModels/login viewModel/login_provider.dart';
import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginValue = context.watch<LoginProvider>();
    LoginProvider loginFunction = context.read<LoginProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 56, right: 56),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            formField(loginValue, loginFunction),
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
  }

  Widget formField(LoginProvider loginValue, LoginProvider loginFunction) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: loginValue.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username :',
            style: TextStyle(fontWeight: FontWeight.w700, color: rocketMetalic),
          ),
          const SizedBox(
            height: 12,
          ),
          Input(
            controller: loginValue.usernameController,
            hintText: 'Masukan username kamu',
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
            style: TextStyle(fontWeight: FontWeight.w700, color: rocketMetalic),
          ),
          const SizedBox(
            height: 12,
          ),
          Input(
            controller: loginValue.passwordController,
            hintText: 'Masukan password kamu',
            keyboardType: TextInputType.visiblePassword,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonField(
      LoginProvider value, LoginProvider function, BuildContext context) {
    return AbsorbPointer(
      absorbing: value.loggedInStatus != Status.authenticating ? false : true,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        color: value.loggedInStatus != Status.authenticating
            ? primaryColor
            : grey.shade300,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: value.loggedInStatus != Status.authenticating
            ? () {
                function.login(context);
              }
            : () {},
        child: FittedBox(
          child: value.loggedInStatus != Status.authenticating
              ? const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )
              : const Text(
                  'Loading..',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }

  Widget anotherButton(
      LoginProvider value, LoginProvider function, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: CheckboxListTile(
            contentPadding: const EdgeInsets.only(right: 20),
            title: Text(
              'Remember me',
              style: TextStyle(
                color: rocketMetalic,
                fontSize: 14,
              ),
            ),
            value: value.rememberMe,
            onChanged: (_) {
              return function.functionRememberMe();
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
