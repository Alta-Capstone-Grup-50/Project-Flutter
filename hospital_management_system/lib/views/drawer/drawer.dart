import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:provider/provider.dart';

import '../../utilities/common/case_dialog.dart';
import '../../viewModels/login_viewModel/login_viewModel.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key, required this.keyScreens}) : super(key: key);
  late final Widget divider = _divider();
  final keyScreens;

  ScrollController scrollControllerDrawer = ScrollController();

  @override
  Widget build(BuildContext context) {
    LoginProvider logoutFunction = context.read<LoginProvider>();
    LoginProvider loginValue = context.watch<LoginProvider>();
    return Drawer(
      child: ListView(
        controller: scrollControllerDrawer,
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItem(
            context,
            text: 'Home',
            route: '/home',
            keyScreen: 'HomeScreen',
          ),
          divider,
          _drawerItem(
            context,
            text: 'Data Pasien',
            route: '/pasien',
            keyScreen: 'PasienScreen',
          ),
          divider,
          _drawerItem(
            context,
            text: 'Data Rawat Jalan',
            route: '/rawatJalan',
            keyScreen: 'RawatScreen',
          ),
          divider,
          _drawerItem(
            context,
            text: 'Data Tenaga Kesehatan',
            route: '/tenagaKesehatan',
            keyScreen: 'DokterPerawatScreen',
          ),
          divider,
          (loginValue.user.level == 'Dokter' ||
                  loginValue.user.level == 'Perawat')
              ? const SizedBox.shrink()
              : _drawerItem(
                  context,
                  text: 'Manage Account',
                  route: '/manage',
                  keyScreen: 'ManageScreen',
                ),
          const SizedBox(
            height: 30,
          ),
          _logOut(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              showCaseDialog(
                context,
                title: 'Konfirmasi',
                label: 'Apakah anda yakin ingin logout?',
                cancelVisible: true,
                onPressed: () {
                  Navigator.of(context).pop();
                  logoutFunction.logout(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      thickness: 1,
      height: 1,
      indent: 40,
      endIndent: 20,
      color: Colors.black38,
    );
  }

  Widget _drawerHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
      child: Image.asset(
        'assets/icons/logo.png',
        scale: 1.5,
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    String? text,
    String? route,
    String? keyScreen,
  }) {
    return ListTile(
      enabled: (keyScreen != keyScreens) ? true : false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (keyScreen != keyScreens) ? Colors.black : grey.shade200,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        if (keyScreens == 'HomeScreen') {
          Navigator.pop(context);
          Navigator.pushNamed(context, route!);
        } else if (keyScreens != 'HomeScreen') {
          if (route == '/home') {
            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            Navigator.pushReplacementNamed(context, route!);
          }
        }
      },
    );
  }

  Widget _logOut({IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
