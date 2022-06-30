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
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.backgroundColor,
    this.expands,
    this.maxLines,
    this.minLines,
    this.textAlignVertical,
    this.contentPadding,
    this.cursorHeight,
    this.borderRadius,
    this.enabled,
    this.initialValue,
    this.textInputAction,
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
  Function(String)? onChanged;
  bool? expands;
  int? maxLines;
  int? minLines;
  TextAlignVertical? textAlignVertical;
  EdgeInsetsGeometry? contentPadding;
  double? cursorHeight;
  BorderRadius? borderRadius;
  bool? enabled;
  String? initialValue;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      initialValue: initialValue,
      cursorHeight: cursorHeight,
      textAlignVertical: textAlignVertical,
      validator: validator,
      expands: expands ?? false,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      enabled: enabled,
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
        contentPadding: contentPadding ?? const EdgeInsets.only(left: 10),
        hintStyle: const TextStyle(color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(20)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(20)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
