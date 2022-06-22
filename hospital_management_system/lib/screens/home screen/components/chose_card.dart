import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewModels/home%20provider/home_provider.dart';
import 'package:provider/provider.dart';
import '/utilities/constants/color.dart';

class ChoseCard extends StatelessWidget {
  ChoseCard({
    Key? key,
    required this.title,
    required this.openHistory,
    required this.image,
    required this.page,
  }) : super(key: key);

  final String title, openHistory, image;

  var page;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    if (title == 'Data Pasien') {
                      functionProvider.actionChoseCardPasien();
                    } else if (title == 'Data Dokter dan Perawat') {
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
                          minHeight: MediaQuery.of(context).size.height / 5,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700),
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
                                    Text(
                                      openHistory,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
