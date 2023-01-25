import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaseDialog extends StatelessWidget {
  CaseDialog(
      {Key? key,
      required this.title,
      required this.label,
      required this.onPressed,
      this.confirmLabel,
      this.cancelLabel,
      this.cancelVisible})
      : super(key: key);

  String? title;
  String? label;
  String? confirmLabel;
  String? cancelLabel;
  void Function()? onPressed;
  bool? cancelVisible;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        SvgPicture.asset(
          'assets/icons/warning.svg',
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(title!),
        )
      ]),
      content: Text(label!),
      actions: [
        (cancelVisible == true)
            ? TextButton(
                child: Text(cancelLabel!),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : const SizedBox.shrink(),
        TextButton(
          onPressed: onPressed,
          child: Text(confirmLabel!),
        ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 20, right: 15),
    );
  }
}

Future showCaseDialog(
  BuildContext context, {
  required String title,
  required String label,
  String? confirmLabel = 'Yakin',
  String? cancelLabel = 'batal',
  bool? cancelVisible = true,
  required void Function()? onPressed,
}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CaseDialog(
            title: title,
            label: label,
            onPressed: onPressed,
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
            cancelVisible: cancelVisible,
          ));
}
