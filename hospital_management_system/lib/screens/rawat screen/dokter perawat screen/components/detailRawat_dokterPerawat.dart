import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/pasien_data_model.dart';
import 'package:hospital_management_system/screens/rawat%20screen/dokter%20perawat%20screen/components/keteranganRawat_dokterPerawat.dart';
import 'package:hospital_management_system/utilities/components/input.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/viewModels/rawat%20viewModel/rawat_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../utilities/constants/responsive.dart';

class DetailRawatDokterPerawat extends StatelessWidget {
  DetailRawatDokterPerawat(
      {Key? key, required this.query, required this.queryPage})
      : super(key: key);

  DataGridCellTapDetails? query;
  int queryPage;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    int index = query!.rowColumnIndex.rowIndex - 1;
    int indexOfPage = index + (queryPage + 1) - 1;

    RawatProvider valueProvider = context.read<RawatProvider>();
    List<DataPasien> putDataRawat = valueProvider.listPasienData;
    return AlertDialog(
      content: Stack(
        children: [
          SizedBox(
            width: maxWidth / 1.6,
            height: MediaQuery.of(context).size.height / 1.4,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 40, bottom: 40, top: 20),
                        child: Text(
                          'Data Detail Pasien Rawat Jalan',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'NIK',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: putDataRawat[indexOfPage].nik,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Nama',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: putDataRawat[indexOfPage].nama,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Alamat',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: putDataRawat[indexOfPage].alamat,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Jenis Kelamin',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue:
                                    putDataRawat[indexOfPage].jenisKelamin,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Nomor Telpon',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: putDataRawat[indexOfPage].noTelp,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Jenis Penyakit',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue:
                                    putDataRawat[indexOfPage].jenisPenyakit,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Jenis Penanganan',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4.75,
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: 'Rawat Jalan',
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                textAlignVertical: TextAlignVertical.center,
                                enabled: false,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tempat Lahir',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Input(
                                          initialValue:
                                              putDataRawat[indexOfPage]
                                                  .tempatLahir,
                                          borderRadius: const BorderRadius.all(
                                              Radius.zero),
                                          keyboardType: TextInputType.none,
                                          enabled: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tanggal Lahir',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Input(
                                          initialValue:
                                              putDataRawat[indexOfPage]
                                                  .tanggalLahir,
                                          borderRadius: const BorderRadius.all(
                                              Radius.zero),
                                          keyboardType: TextInputType.none,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          enabled: false,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nomor Antrian',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Input(
                                          initialValue:
                                              putDataRawat[indexOfPage]
                                                  .noAntrian
                                                  .toString(),
                                          borderRadius: const BorderRadius.all(
                                              Radius.zero),
                                          keyboardType: TextInputType.none,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          enabled: false,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Jadwal Rawat Jalan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Input(
                                          initialValue:
                                              putDataRawat[indexOfPage]
                                                  .jadwalRawat,
                                          borderRadius: const BorderRadius.all(
                                              Radius.zero),
                                          keyboardType: TextInputType.none,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          enabled: false,
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    await openKeteranganRawatDokterPerawat(
                                        context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: green.shade300,
                                  ),
                                  child: const Text(
                                    'Keterangan',
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                  ),
                                  child: const Text(
                                    'Kembali',
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

Future openDetailRawatDokterPerawat(BuildContext context, query, queryPage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DetailRawatDokterPerawat(
            query: query,
            queryPage: queryPage,
          ));
}
