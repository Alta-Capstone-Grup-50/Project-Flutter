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
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.prefixText,
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
    this.readOnly,
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
  Function()? onTap;
  String? Function(String?)? validator;
  Widget? prefixIcon;
  String? prefixText;
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
  bool? readOnly;
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
      readOnly: readOnly ?? false,
      onTap: onTap,
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
        prefixText: prefixText,
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
