import 'package:flutter/material.dart';
import 'package:hospital_management_system/providers/login_provider.dart';
import 'package:hospital_management_system/utilities/constants/validate.dart';
import 'package:provider/provider.dart';

import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider loginValue = context.watch<LoginProvider>();
    LoginProvider loginFunction = context.read<LoginProvider>();
    return Padding(
      padding: const EdgeInsets.only(left: 56, top: 100, right: 56),
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
            height: 50,
          ),
          formField(loginValue, loginFunction),
          const SizedBox(
            height: 40,
          ),
          buttonField(loginValue, loginFunction, context),
          const SizedBox(
            height: 5,
          ),
          anotherButton(),
        ],
      ),
    );
  }

  Widget formField(LoginProvider loginValue, LoginProvider loginFunction) {
    return Form(
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
              return value!.isEmpty ? "Please enter your password" : null;
            },
            suffixIcon: GestureDetector(
              child: loginValue.obscure
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onTap: () {
                loginFunction.functionObscure();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonField(value, function, context) {
    return value.loggedInStatus == Status.authenticating
        ? const CircularProgressIndicator()
        : MaterialButton(
            minWidth: double.infinity,
            height: 60,
            color: primaryColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            onPressed: () {
              function.login(context);
            },
            child: const FittedBox(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          );
  }

  Widget anotherButton() {
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
            value: false,
            onChanged: (_) {},
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        InkWell(
          highlightColor: Colors.white,
          hoverColor: Colors.white,
          splashColor: Colors.white,
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
