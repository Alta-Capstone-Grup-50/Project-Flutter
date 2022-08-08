import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/utilities/constants/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilities/common/case_dialog.dart';

class NotionDialog extends StatelessWidget {
  const NotionDialog({
    Key? key,
  }) : super(key: key);

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
            width: maxWidth / 2.2,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Silahkan hubungi dan klik E-mail berikut\nini untuk melakukan reset password :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: (Responsive.isMobile(context)) ? 14 : 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showCaseDialog(context,
                        title: 'Konfirmasi',
                        label: 'Apakah anda ingin melanjutkan ke Gmail?',
                        onPressed: () async {
                      final url = Uri(
                        scheme: 'mailto',
                        path: 'admin@healthid.ac.id',
                        query: 'subject=Forgot Password&body=Keterangan : ',
                      );
                      if (await canLaunchUrl(url)) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        launchUrl(url);
                      } else {
                        print("Can't launch $url");
                      }
                    });
                  },
                  child: Text(
                    'admin@healthid.ac.id',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primaryColor.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future showNotion(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const NotionDialog());
}
