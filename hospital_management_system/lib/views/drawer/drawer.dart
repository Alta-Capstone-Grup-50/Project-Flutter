import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModels/login viewModel/login_viewModel.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  late final Widget divider = _divider();

  @override
  Widget build(BuildContext context) {
    LoginProvider logoutFunction = context.read<LoginProvider>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItem(text: 'Home'),
          divider,
          _drawerItem(text: 'Data Pasien'),
          divider,
          _drawerItem(text: 'Data Rawat Jalan'),
          divider,
          _drawerItem(text: 'Data Tenaga Kesehatan'),
          divider,
          const SizedBox(
            height: 30,
          ),
          _drawerItem2(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              logoutFunction.logout(context);
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

  Widget _drawerItem({String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: [
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
      onTap: () {},
    );
  }

  Widget _drawerItem2(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
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
