import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    this.obscureText = false,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.backgroundColor,
  }) : super(key: key);

  TextEditingController? controller;
  bool obscureText;
  String? hintText;
  String? labelText;
  String? errorText;
  TextInputType? keyboardType;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Widget? suffix;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        suffix: suffix,
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor,
        contentPadding: const EdgeInsets.only(left: 10),
        hintStyle: const TextStyle(color: Colors.black45),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
