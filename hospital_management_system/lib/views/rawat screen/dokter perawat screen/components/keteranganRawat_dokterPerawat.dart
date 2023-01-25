import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/views/rawat%20screen/dokter%20perawat%20screen/components/history_keterangan.dart';
import 'package:provider/provider.dart';
import '../../../../models/keterangan_model.dart';
import '../../../../utilities/common/progress_dialog.dart';
import '../../../../viewModels/login viewModel/login_viewModel.dart';
import '../../../../viewModels/rawatJalan viewModel/rawatJalan_viewModel.dart';
import '/utilities/common/input.dart';

import '/utilities/constants/responsive.dart';
import '../../../../utilities/common/case_dialog.dart';

class KeteranganRawatDokterPerawat extends StatelessWidget {
  KeteranganRawatDokterPerawat(
      {Key? key, required this.id, required this.namePasien, this.keterangan})
      : super(key: key);

  int id;
  String namePasien;
  String? keterangan;
  final TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RawatJalanViewModel functionProvider = context.read<RawatJalanViewModel>();
    LoginProvider loginFunction = context.watch<LoginProvider>();
    final ProgressDialog loadingWidget = ProgressDialog(
      context,
      isDismissible: false,
    );
    loadingWidget.style(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30));

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
                    right: (Responsive.isMobile(context)) ? 0 : 30),
                child: showDetail(
                    context, functionProvider, loginFunction, loadingWidget)),
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
                ),
          (!Responsive.isMobile(context))
              ? Positioned(
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
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget showDetail(BuildContext context, RawatJalanViewModel functionProvider,
      LoginProvider loginFunction, ProgressDialog loadingProgres) {
    // log("ID : $id");
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: (Responsive.isMobile(context)) ? 0 : 40,
                  bottom: 20,
                  top: 20,
                ),
                child: (Responsive.isMobile(context))
                    ? const SizedBox.shrink()
                    : Text(
                        'Keterangan Rawat Jalan',
                        style: TextStyle(
                            fontSize: (Responsive.isMobile(context)) ? 24 : 26,
                            fontWeight: FontWeight.w700),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: (Responsive.isMobile(context)) ? 0 : 40, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Pasien : $namePasien"),
                    Text("Tanggal : ${formatDate(DateTime.now(), [
                          dd,
                          ' ',
                          MM,
                          ' ',
                          yyyy,
                          ' '
                        ], locale: const IndonesianDateLocale())}"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 12,
                    left: (Responsive.isMobile(context)) ? 0 : 40,
                    right: 20),
                height: (Responsive.isMobile(context))
                    ? MediaQuery.of(context).size.height / 2.1
                    : MediaQuery.of(context).size.height / 2.40,
                child: Input(
                  controller: (loginFunction.user.level == 'Dokter' ||
                          loginFunction.user.level == 'Perawat')
                      ? _keteranganController
                      : null,
                  expands: true,
                  maxLines: null,
                  initialValue: (loginFunction.user.level == 'Dokter' ||
                          loginFunction.user.level == 'Perawat')
                      ? null
                      : keterangan,
                  minLines: null,
                  enabled: (loginFunction.user.level == 'Dokter' ||
                          loginFunction.user.level == 'Perawat')
                      ? true
                      : false,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  contentPadding: const EdgeInsets.only(left: 20, top: 20),
                  cursorHeight: 22,
                ),
              ),
              (loginFunction.user.level == 'Dokter' ||
                      loginFunction.user.level == 'Perawat')
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          right: (Responsive.isMobile(context)) ? 30 : 30,
                          bottom: 10,
                          top: 25),
                      child: Row(
                        mainAxisAlignment: (Responsive.isMobile(context))
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.width * 0.28
                                : 120,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: green.shade800)),
                              onPressed: () {
                                openHistoryKeterangan(context);
                              },
                              child: Text(
                                'History',
                                style: TextStyle(
                                    color: green.shade800, fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.width * 0.28
                                : 120,
                            height: 40,
                            child: Consumer<RawatJalanViewModel>(
                              builder: ((context, value, child) =>
                                  ElevatedButton(
                                    onPressed: () {
                                      showCaseDialog(context,
                                          title: 'Konfirmasi',
                                          label:
                                              "Apa anda sudah yakin untuk menyimpan keterangan\ntersebut?",
                                          onPressed: () async {
                                        Navigator.of(context).pop();
                                        functionProvider.createKeterangan(
                                          DataKeterangan(
                                              id: id,
                                              namaPasien: namePasien,
                                              keterangan:
                                                  _keteranganController.text,
                                              tanggal: formatDate(
                                                  DateTime.now(),
                                                  [dd, ' ', MM, ' ', yyyy, ' '],
                                                  locale:
                                                      const IndonesianDateLocale())),
                                        );
                                        await functionProvider
                                            .putProsesKeterangan(
                                                context,
                                                id,
                                                _keteranganController.text,
                                                loadingProgres);
                                        if (value.postStatusKeterangan ==
                                            StatusPostKeterangan.isLoading) {
                                          loadingProgres.show();
                                        }
                                      });
                                    },
                                    child: const Text(
                                      'Simpan',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
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
                        'Keterangan Rawat Jalan',
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

Future openKeteranganRawatDokterPerawat(
    BuildContext context, int id, String namePasien, String keterangan) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => KeteranganRawatDokterPerawat(
            id: id,
            namePasien: namePasien,
            keterangan: keterangan,
          ));
}
