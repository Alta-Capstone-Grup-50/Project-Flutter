import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';

class DialogAlert extends StatelessWidget {
  DialogAlert(
      {Key? key,
      required this.isSuccess,
      required this.title,
      this.backButton,
      required this.label})
      : super(key: key);

  final bool isSuccess;
  String title;
  String label;
  Function? backButton;

  final String assetSuccess = 'assets/icons/success.svg';
  final String assetFailed = 'assets/icons/failed.svg';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: maxWidth * 0.35,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.asset(
                isSuccess ? assetSuccess : assetFailed,
                width: 150,
                height: 150,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            Container(
              width: 160,
              height: 36,
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    backButton!();
                  },
                  child: const Text('Kembali')),
            )
          ],
        ),
      ),
    );
  }
}

Future showAlertSuccess(BuildContext context,
    {title, required label, Function? backButton}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DialogAlert(
            isSuccess: true,
            title: title ?? 'Tambah Akun Berhasil',
            label: label,
            backButton: backButton,
          ));
}

Future showAlertFailed(BuildContext context,
    {title, required label, Function? backButton}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DialogAlert(
            isSuccess: false,
            title: title ?? 'Tambah Akun Gagal',
            label: label,
            backButton: backButton,
          ));
}
