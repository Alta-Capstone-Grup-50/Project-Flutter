import 'dart:ui';

import 'package:flutter/material.dart';
import '/viewModels/home viewModel/home_viewModel.dart';
import 'package:provider/provider.dart';
import '/utilities/constants/responsive.dart';
import '/utilities/constants/color.dart';

class ChoseCard extends StatelessWidget {
  ChoseCard(
      {Key? key,
      required this.title,
      required this.openHistory,
      required this.image,
      required this.page,
      this.color})
      : super(key: key);

  final String title, openHistory, image;
  final Color? color;

  String page;

  @override
  Widget build(BuildContext context) {
    return (!Responsive.isMobile(context))
        ? Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black38, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Consumer<HomeProvider>(
                  builder: ((context, functionProvider, child) => InkWell(
                        onTap: () {
                          if (page != '') {
                            Navigator.pushReplacementNamed(context, page);
                          }
                          if (title == 'Data Pasien') {
                            functionProvider.actionChoseCardPasien();
                          } else if (title == 'Data Tenaga Kesehatan') {
                            functionProvider.actionChoseCardDokter();
                          } else {
                            functionProvider.actionChoseCardRawat();
                          }
                          ;
                        },
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              constraints: BoxConstraints(
                                minHeight: (Responsive.isDesktop(context) ||
                                        Responsive.isTablet(context) &&
                                            MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.landscape)
                                    ? MediaQuery.of(context).size.height / 5
                                    : MediaQuery.of(context).size.height / 10,
                              ),
                              child: (color != null)
                                  ? const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'maintenance :)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : Image.asset(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                            Container(
                              color: (color != null) ? color : null,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context) &&
                                              MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.landscape)
                                      ? SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: (color != null)
                                                        ? Colors.white
                                                        : null,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  ImageIcon(
                                                    const AssetImage(
                                                        'assets/icons/iconTable.png'),
                                                    size: 15,
                                                    color: primaryColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      openHistory,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: (color != null)
                                                              ? Colors.white
                                                              : Colors.black54,
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      : Expanded(
                                          child: Text(
                                            title,
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: const TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))),
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Card(
                semanticContainer: true,
                color: primaryColor.shade300,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer<HomeProvider>(
                  builder: ((context, functionProvider, child) => InkWell(
                        onTap: () {
                          if (page != '') {
                            Navigator.of(context).pushReplacementNamed(page);
                          }
                          if (title == 'Data Pasien') {
                            functionProvider.actionChoseCardPasien();
                          } else if (title == 'Data Tenaga Kesehatan') {
                            functionProvider.actionChoseCardDokter();
                          } else {
                            functionProvider.actionChoseCardRawat();
                          }
                          ;
                        },
                        child: Center(
                          child: Text(
                            title,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )),
                )),
          );
  }
}
