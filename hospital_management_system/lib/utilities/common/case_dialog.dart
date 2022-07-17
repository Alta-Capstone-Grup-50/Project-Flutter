import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaseDialog extends StatelessWidget {
  CaseDialog({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  String? label;
  void Function()? onPressed;

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
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Konfirmasi'),
        )
      ]),
      content: Text(label!),
      actions: [
        TextButton(
          child: const Text("Batal"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text("Yakin"),
        ),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 10),
    );
  }
}

Future showCaseDialog(
  BuildContext context, {
  required String label,
  required void Function()? onPressed,
}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CaseDialog(
            label: label,
            onPressed: onPressed,
          ));
}
