import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';

class Content extends StatelessWidget {
  Content({Key? key}) : super(key: key);

  bool isProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 70),
        height: MediaQuery.of(context).size.height * 0.4,
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
            : ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return const ListTile(
                            title: Text(
                              'Kunjungan Pejabat',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              'Diberitahukan kepada seluruh karyawan rumah sakit health.id, bahwa pada hari senin tanggal 20 juni 2022 akan ada kunjungan dari mentri kesehatan.',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ));
  }
}
