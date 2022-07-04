import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/models/pasien_data_model.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import '/viewModels/pasien viewModel/pasien_viewModel.dart';

class DetailPasien extends StatelessWidget {
  DetailPasien({Key? key, required this.query, required this.queryPage})
      : super(key: key);

  DataGridCellTapDetails? query;
  int queryPage;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    int index = query!.rowColumnIndex.rowIndex - 1;
    int indexOfPage = index + (queryPage + 1) - 1;

    PasienProvider valueProvider = context.read<PasienProvider>();
    List<DataPasien> putDataPasien = valueProvider.listPasienData;

    return AlertDialog(
      content: Stack(
        children: [
          SizedBox(
            width: maxWidth / 1.6,
            height: (Responsive.isMobile(context))
                ? MediaQuery.of(context).size.height / 1.3
                : MediaQuery.of(context).size.height / 1.4,
            child: Padding(
              padding: EdgeInsets.only(
                  right: (Responsive.isMobile(context)) ? 0 : 40),
              child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility:
                      (Responsive.isMobile(context)) ? false : true,
                  child: showDetail(context, putDataPasien, indexOfPage)),
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

  Widget showDetail(
    BuildContext context,
    List<DataPasien> putDataPasien,
    int indexOfPage,
  ) {
    return Stack(children: [
      SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: (Responsive.isMobile(context)) ? 0 : 40,
                    bottom: 40,
                    top: 20),
                child: (Responsive.isMobile(context))
                    ? const SizedBox.shrink()
                    : const Text(
                        'Data Detail Pasien',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      )),
            Container(
              width: (Responsive.isMobile(context))
                  ? MediaQuery.of(context).size.width * 0.7
                  : MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(
                  left: (Responsive.isMobile(context)) ? 5 : 40),
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
                      initialValue: putDataPasien[indexOfPage].nik,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                      initialValue: putDataPasien[indexOfPage].nama,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                      initialValue: putDataPasien[indexOfPage].alamat,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                      initialValue: putDataPasien[indexOfPage].jenisKelamin,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                      initialValue: putDataPasien[indexOfPage].noTelp,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  (!Responsive.isMobile(context))
                      ? Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tempat Lahir',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Input(
                                      initialValue: putDataPasien[indexOfPage]
                                          .tempatLahir,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tanggal Lahir',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Input(
                                      initialValue: putDataPasien[indexOfPage]
                                          .tanggalLahir,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
                                      keyboardType: TextInputType.none,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enabled: false,
                                      suffixIcon:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tempat Lahir',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue:
                                    putDataPasien[indexOfPage].tempatLahir,
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
                              'Tanggal Lahir',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue:
                                    putDataPasien[indexOfPage].tanggalLahir,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                textAlignVertical: TextAlignVertical.center,
                                enabled: false,
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          ],
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
                      initialValue: putDataPasien[indexOfPage].jenisPenyakit,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                    width: (Responsive.isMobile(context))
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width / 4.75,
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      initialValue: 'Rawat Jalan',
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      textAlignVertical: TextAlignVertical.center,
                      enabled: false,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: (Responsive.isMobile(context)) ? 20 : 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
      (Responsive.isMobile(context))
          ? Positioned(
              left: -15,
              top: -5,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: IconButton(
                          splashRadius: 1,
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 19,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    const Text(
                      'Detail Pasien',
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink()
    ]);
  }
}

Future openDetailPasien(BuildContext context, query, queryPage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DetailPasien(
            query: query,
            queryPage: queryPage,
          ));
}
