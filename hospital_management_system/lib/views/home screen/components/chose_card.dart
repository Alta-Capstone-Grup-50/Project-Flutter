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
                          Navigator.pushNamed(context, page);
                        }
                        if (title == 'Data Pasien') {
                          functionProvider.actionChoseCardPasien();
                        } else if (title == 'Data Tenaga Kesehatan') {
                          functionProvider.actionChoseCardDokter();
                        } else {
                          functionProvider.actionChoseCardRawat();
                        }
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
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
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context) &&
                                      MediaQuery.of(context).orientation ==
                                          Orientation.landscape)
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  alignment: Alignment.center,
                                  color: Colors.black.withOpacity(0.57),
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700),
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
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                        ],
                      ),
                    )),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(0.57),
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
                          ],
                        ),
                      )),
                )),
          );
  }
}
