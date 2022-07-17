import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/views/home%20screen/components/content_dumy.dart';

import '../../../utilities/constants/responsive.dart';

class Content extends StatelessWidget {
  Content({Key? key}) : super(key: key);

  bool isProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width * 0.1
            : (Responsive.isTablet(context) &&
                    MediaQuery.of(context).orientation == Orientation.landscape)
                ? 70
                : 20,
      ),
      height: (Responsive.isMobile(context)) ? 270 : 320,
      decoration: BoxDecoration(
        color: grey.shade100.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Stack(children: [
        Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Lihat Selengkapnya',
                  style: TextStyle(color: primaryColor.shade900),
                ))),
        (isProgress != false)
            ? Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          content_dummy[index].header!,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: (Responsive.isMobile(context)) ? 16 : 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          content_dummy[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: (Responsive.isMobile(context)) ? 14 : 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
              ),
      ]),
    );
  }
}
