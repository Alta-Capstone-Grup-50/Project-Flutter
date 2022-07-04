import 'package:flutter/material.dart';
import '/utilities/common/input.dart';

import '/utilities/constants/responsive.dart';

class KeteranganRawatDokterPerawat extends StatelessWidget {
  const KeteranganRawatDokterPerawat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          SizedBox(
            width: maxWidth / 1.5,
            height: (Responsive.isMobile(context))
                ? MediaQuery.of(context).size.height / 1.3
                : MediaQuery.of(context).size.height / 1.5,
            child: Padding(
              padding: EdgeInsets.only(
                  right: (Responsive.isMobile(context)) ? 0 : 40),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: (Responsive.isMobile(context)) ? 0 : 55,
                            bottom: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.height * 0.04
                                : 25,
                            top: 15),
                        child: (Responsive.isMobile(context))
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15,
                                      top: 4,
                                    ),
                                    child: IconButton(
                                        splashRadius: 20,
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 19,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: const Text(
                                      'Detail Pasien Rawat Jalan',
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                'Data Detail Pasien Rawat Jalan',
                                style: TextStyle(
                                    fontSize: (Responsive.isMobile(context))
                                        ? 24
                                        : 26,
                                    fontWeight: FontWeight.w700),
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.width * 0.03
                                : 55),
                        height: (Responsive.isMobile(context))
                            ? MediaQuery.of(context).size.height / 1.9
                            : MediaQuery.of(context).size.height / 2.25,
                        child: Input(
                          expands: true,
                          maxLines: null,
                          minLines: null,
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 20),
                          cursorHeight: 22,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: (Responsive.isMobile(context)) ? 0 : 55,
                            bottom: 25),
                        child: Row(
                          mainAxisAlignment: (Responsive.isMobile(context))
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: (Responsive.isMobile(context))
                                  ? MediaQuery.of(context).size.width * 0.25
                                  : 120,
                              height: (Responsive.isMobile(context))
                                  ? MediaQuery.of(context).size.height * 0.05
                                  : 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    side: const BorderSide(color: Colors.red)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Batal',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: (Responsive.isMobile(context))
                                  ? MediaQuery.of(context).size.width * 0.25
                                  : 120,
                              height: (Responsive.isMobile(context))
                                  ? MediaQuery.of(context).size.height * 0.05
                                  : 45,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Simpan',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          (Responsive.isMobile(context))
              ? const SizedBox.shrink()
              : Positioned(
                  right: -5,
                  top: -5,
                  child: InkResponse(
                    radius: 25,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: (Responsive.isMobile(context)) ? 25 : 30,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

Future openKeteranganRawatDokterPerawat(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const KeteranganRawatDokterPerawat());
}
