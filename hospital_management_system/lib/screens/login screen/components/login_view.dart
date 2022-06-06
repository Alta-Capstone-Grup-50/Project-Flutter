import 'package:flutter/material.dart';

import '/utilities/components/input.dart';
import '/utilities/constants/color.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          formField(),
          const SizedBox(
            height: 40,
          ),
          buttonField(),
          const SizedBox(
            height: 5,
          ),
          anotherButton(),
        ],
      ),
    );
  }

  Widget formField() {
    bool tap = false;
    return Form(
      key: _formKey,
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
            controller: usernameController,
            hintText: 'Masukan username kamu',
            onSaved: (value) {},
            validator: (value) {},
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
            controller: passwordController,
            hintText: 'Masukan password kamu',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onSaved: (value) {},
            validator: (value) {},
            suffixIcon: GestureDetector(
              child: const Icon(Icons.visibility),
              onTap: () {
                tap = !tap;
                print(tap);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonField() {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      color: primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onPressed: () {},
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
