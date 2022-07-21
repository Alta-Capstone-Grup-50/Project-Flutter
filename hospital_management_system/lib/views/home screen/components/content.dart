import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/views/home%20screen/components/content_dumy.dart';
import 'package:provider/provider.dart';

import '../../../utilities/constants/responsive.dart';
import '../../../viewModels/home viewModel/home_viewModel.dart';

class Content extends StatelessWidget {
  Content({Key? key}) : super(key: key);

  bool isProgress = false;

  @override
  Widget build(BuildContext context) {
    var valueProvider = context.watch<HomeProvider>();
    var functionProvider = context.read<HomeProvider>();
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.1
              : (Responsive.isTablet(context) &&
                      MediaQuery.of(context).orientation ==
                          Orientation.landscape)
                  ? 70
                  : 20,
        ),
        height: (Responsive.isMobile(context))
            ? valueProvider.expansionTile == true
                ? 650
                : 270
            : valueProvider.expansionTile == true
                ? 630
                : 320,
        decoration: BoxDecoration(
          color: grey.shade100.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: (isProgress != false)
            ? Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
              )
            : Stack(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars:
                            valueProvider.expansionTile == true ? true : false),
                    child: ListView.builder(
                        physics: valueProvider.expansionTile == true
                            ? const ClampingScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: content_dummy.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              content_dummy[index].header!,
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isMobile(context)) ? 16 : 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              content_dummy[index].title!,
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isMobile(context)) ? 14 : 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 90,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white,
                          ],
                          stops: const [
                            0.0,
                            1.0
                          ]),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Icon(
                      (valueProvider.expansionTile != true)
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      size: 40,
                    ),
                    onTap: () {
                      functionProvider.expansionTileVisible();
                    },
                  ),
                ),
              ]));
  }
}
