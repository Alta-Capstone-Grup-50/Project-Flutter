import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';

class DialogAlert extends StatelessWidget {
  DialogAlert({Key? key, required this.isSuccess, required this.label})
      : super(key: key);

  final bool isSuccess;
  String label;

  final String assetSuccess = 'assets/icons/success.svg';
  final String assetFailed = 'assets/icons/failed.svg';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          Positioned(
            right: -5,
            top: -5,
            child: InkResponse(
              radius: 25,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ),
          SizedBox(
            width: maxWidth / 2,
            height: 500,
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
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future openDialogSuccess(BuildContext context, {required label}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DialogAlert(
            isSuccess: true,
            label: label,
          ));
}

Future openDialogFailed(BuildContext context, {required label}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DialogAlert(
            isSuccess: false,
            label: label,
          ));
}
