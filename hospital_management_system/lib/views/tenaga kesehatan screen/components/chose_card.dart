import 'package:flutter/material.dart';
import '../../../utilities/constants/color.dart';
import '/viewModels/home viewModel/home_viewModel.dart';
import 'package:provider/provider.dart';

import '../../../utilities/constants/responsive.dart';

class ChoseCard extends StatelessWidget {
  ChoseCard({
    Key? key,
    required this.title,
    required this.image,
    required this.page,
  }) : super(key: key);

  final String title, image;

  var page;

  @override
  Widget build(BuildContext context) {
    return (!Responsive.isMobile(context))
        ? Expanded(
            child: Center(
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
                            Navigator.pushNamedAndRemoveUntil(
                                context, page, ModalRoute.withName(page));

                            functionProvider.actionChoseCardDokter();
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ))),
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
                          Navigator.pushNamedAndRemoveUntil(
                              context, page, ModalRoute.withName(page));

                          functionProvider.actionChoseCardDokter();
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
