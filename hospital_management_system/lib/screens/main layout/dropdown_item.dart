import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewModels/login%20viewModel/login_provider.dart';
import 'package:provider/provider.dart';

class ShapedWidget extends StatelessWidget {
  const ShapedWidget();
  final double padding = 4;

  @override
  Widget build(BuildContext context) {
    LoginProvider logoutFunction = context.read<LoginProvider>();
    return Center(
      child: Material(
          clipBehavior: Clip.antiAlias,
          shape: ShapedWidgetBorder(
              borderRadius: BorderRadius.all(Radius.circular(padding)),
              padding: padding),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(padding).copyWith(bottom: padding * 2),
            child: SizedBox(
              height: 40,
              width: 150,
              child: MaterialButton(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  logoutFunction.logout(context);
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
            ),
          )),
    );
  }
}

class ShapedWidgetBorder extends RoundedRectangleBorder {
  const ShapedWidgetBorder({
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
