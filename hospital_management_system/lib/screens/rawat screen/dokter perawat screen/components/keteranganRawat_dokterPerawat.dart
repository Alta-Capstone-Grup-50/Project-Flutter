import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/components/input.dart';

import '../../../../utilities/constants/responsive.dart';

class KeteranganRawatDokterPerawat extends StatelessWidget {
  const KeteranganRawatDokterPerawat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          SizedBox(
            width: maxWidth / 1.5,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 55, bottom: 25, top: 15),
                        child: Text(
                          'Keterangan Dokter',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 55),
                        height: MediaQuery.of(context).size.height / 2.25,
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
                        padding: const EdgeInsets.only(right: 55, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 45,
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
                              width: 120,
                              height: 45,
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
          Positioned(
            right: -5,
            top: -5,
            child: InkResponse(
              radius: 25,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
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
