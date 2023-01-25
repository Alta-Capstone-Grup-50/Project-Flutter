import 'package:flutter/material.dart';
import 'package:hospital_management_system/views/main%20layout/main_layout.dart';
import 'package:hospital_management_system/views/manage%20account%20screen/components/addAccount.dart';

import '../../utilities/constants/responsive.dart';

class AddAcountScreen extends StatelessWidget {
  const AddAcountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'addAcount',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                    ? 70
                    : 20,
                top: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/manage'),
                  child: const Text(
                    "Manage Account > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text(
                  "Tambah Akun",
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                  top: (Responsive.isMobile(context))
                      ? 60
                      : MediaQuery.of(context).size.height * 0.10),
              width: (Responsive.isMobile(context))
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.width * 0.5,
              child: const AddAccount()),
        ],
      ),
    );
  }
}
