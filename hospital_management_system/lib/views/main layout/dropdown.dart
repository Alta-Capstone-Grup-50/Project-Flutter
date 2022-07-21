import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/common/case_dialog.dart';
import '../../viewModels/login viewModel/login_viewModel.dart';
import '../../viewModels/main layout viewModel/mainLayout_viewModel.dart';

class Dropdown extends StatelessWidget {
  Dropdown({Key? key, required this.keyScreen}) : super(key: key);
  final double padding = 4;
  String? keyScreen;

  @override
  Widget build(BuildContext context) {
    LoginProvider logoutFunction = context.read<LoginProvider>();
    final provideFunction = context.read<MainLayoutProvider>();
    return Center(
      child: Material(
          clipBehavior: Clip.antiAlias,
          shape: DropdownBorder(
              borderRadius: BorderRadius.all(Radius.circular(padding)),
              padding: padding),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(padding).copyWith(bottom: padding * 2),
            child: SizedBox(
              height: (keyScreen != 'ManageScreen') ? 80 : 40,
              width: (keyScreen != 'ManageScreen') ? 190 : 150,
              child: Column(
                mainAxisAlignment: (keyScreen != 'ManageScreen')
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  (keyScreen != 'ManageScreen')
                      ? MaterialButton(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            provideFunction.changeMenuShown();
                            if (keyScreen == 'HomeScreen') {
                              Navigator.pushNamed(context, '/manage');
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, '/manage');
                            }
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'Manage Account',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  MaterialButton(
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      showCaseDialog(
                        context,
                        title: 'Konfirmasi',
                        label: 'Apakah anda yakin ingin logout ?',
                        onPressed: () {
                          Navigator.pop(context);

                          logoutFunction.logout(context);
                          Future.delayed(const Duration(seconds: 1), () async {
                            provideFunction.changeMenuShown();
                          });
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.logout,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Log out',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class DropdownBorder extends RoundedRectangleBorder {
  const DropdownBorder({
    required this.padding,
    side = BorderSide.none,
    borderRadius = BorderRadius.zero,
  }) : super(side: side, borderRadius: borderRadius);
  final double padding;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.width - 8.0, rect.top)
      ..lineTo(rect.width - 20.0, rect.top - 16.0)
      ..lineTo(rect.width - 32.0, rect.top)
      ..addRRect(borderRadius.resolve(textDirection).toRRect(Rect.fromLTWH(
          rect.left, rect.top, rect.width, rect.height - padding)));
  }
}
