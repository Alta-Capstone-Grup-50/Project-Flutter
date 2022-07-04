import 'package:flutter/material.dart';
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 10),
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
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => page));

                        functionProvider.actionChoseCardDokter();
                      },
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey,
                            constraints: BoxConstraints(
                              minHeight: (Responsive.isDesktop(context) ||
                                      Responsive.isTablet(context) &&
                                          MediaQuery.of(context).orientation ==
                                              Orientation.landscape)
                                  ? MediaQuery.of(context).size.height / 5
                                  : MediaQuery.of(context).size.height / 10,
                            ),
                            child: Image.asset(
                              image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.03),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
