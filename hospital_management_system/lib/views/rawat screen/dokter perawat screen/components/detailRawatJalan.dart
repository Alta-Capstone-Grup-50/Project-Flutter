import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/rawatJalan/data/rawatJalan_model.dart';
import 'package:hospital_management_system/models/rawatJalan/update/rawatJalan_update_model.dart';
import 'package:hospital_management_system/viewModels/login_viewModel/login_viewModel.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../utilities/common/case_dialog.dart';
import '../../../../utilities/common/progress_dialog.dart';
import '../../../../viewModels/rawatJalan_viewModel/rawatJalan_viewModel.dart';

import '/views/rawat%20screen/dokter%20perawat%20screen/components/keteranganRawat_dokterPerawat.dart';
import '../../../../utilities/common/input.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';

class DetailRawatJalan extends StatefulWidget {
  DetailRawatJalan({Key? key, required this.query, required this.queryPage})
      : super(key: key);

  DataGridCellTapDetails? query;
  int queryPage;

  @override
  State<DetailRawatJalan> createState() => _DetailRawatJalanState();
}

class _DetailRawatJalanState extends State<DetailRawatJalan> {
  final _scrollController = ScrollController();
  final TextEditingController _jadwalRawatController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _jadwalRawatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.query!.rowColumnIndex.rowIndex - 1;
    int indexOfPage = index + (widget.queryPage + 1) - 1;

    RawatJalanViewModel functionProvider = context.read<RawatJalanViewModel>();
    RawatJalanViewModel valueProvider = context.watch<RawatJalanViewModel>();
    LoginProvider loginValue = context.watch<LoginProvider>();
    List<RawatJalanModel>? putDataRawat;
    if (valueProvider.search.isNotEmpty ||
        valueProvider.searchController.text.isNotEmpty) {
      putDataRawat = valueProvider.search;
    } else {
      putDataRawat = valueProvider.listRawatJalanData;
    }

    final ProgressDialog loadingWidget = ProgressDialog(
      context,
      isDismissible: false,
    );
    loadingWidget.style(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30));

    return AlertDialog(
      content: Stack(children: [
        SizedBox(
          width: maxWidth / 1.6,
          height: (Responsive.isMobile(context))
              ? MediaQuery.of(context).size.height / 1.3
              : MediaQuery.of(context).size.height / 1.4,
          child: Padding(
            padding:
                EdgeInsets.only(right: (Responsive.isMobile(context)) ? 0 : 40),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: (Responsive.isMobile(context)) ? false : true,
              child: showDetail(context, putDataRawat!, indexOfPage,
                  functionProvider, valueProvider, loginValue, loadingWidget),
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
                    if (valueProvider.hEdit == true) {
                      functionProvider.changeEditStatus();
                    }

                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: (Responsive.isMobile(context)) ? 25 : 30,
                  ),
                ),
              )
            : const SizedBox.shrink()
      ]),
    );
  }

  Widget showDetail(
      BuildContext context,
      List<RawatJalanModel> putDataRawat,
      int indexOfPage,
      RawatJalanViewModel functionProvider,
      RawatJalanViewModel valueProvider,
      LoginProvider loginValue,
      ProgressDialog loadingWidget) {
    final List<String> jenisKelamin = [
      'Laki - laki',
      'Perempuan',
    ];

    final List<String> jenisPenanganan = [
      'Rawat Jalan',
    ];

    final List<String> noAntrian = ['G-', 'K-', 'T-', 'U-'];
    String selected = putDataRawat[indexOfPage].noAntrian!.substring(0, 1);
    _jadwalRawatController.text = putDataRawat[indexOfPage].jadwalRawatJalan!;

    if (valueProvider.dateJ != null && valueProvider.timeJ != null) {
      _jadwalRawatController.text = "${formatDate(valueProvider.dateJ!, [
            DD,
            ', ',
            dd,
            ' ',
            MM,
            ' ',
            yyyy
          ], locale: const IndonesianDateLocale())} ${valueProvider.timeJ!.hour.toString().padLeft(2, '0')}.${valueProvider.timeJ!.minute.toString().padLeft(2, '0')} WIB";
    }

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
                top: 20,
              ),
              child: (Responsive.isMobile(context))
                  ? const SizedBox.shrink()
                  : Text(
                      'Data Detail Pasien Rawat Jalan',
                      style: TextStyle(
                          fontSize: (Responsive.isMobile(context)) ? 24 : 26,
                          fontWeight: FontWeight.w700),
                    ),
            ),
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
                      initialValue: putDataRawat[indexOfPage].nik,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                      initialValue: putDataRawat[indexOfPage].alamat,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                    child: DropdownButtonFormField2(
                      value:
                          (putDataRawat[indexOfPage].jenisKelamin!.isNotEmpty)
                              ? (putDataRawat[indexOfPage].jenisKelamin == 'L')
                                  ? 'Laki - laki'
                                  : 'Perempuan'
                              : ' ',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        enabled: false,
                        fillColor: grey.shade100.withAlpha(65),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: grey.shade300),
                        ),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0, color: Colors.transparent)),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 10),
                      items: jenisKelamin
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      buttonHeight: 50,
                      onChanged: (false == true) ? (value) {} : null,
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
                      initialValue: putDataRawat[indexOfPage].noTelepon,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.phone,
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
                      initialValue: putDataRawat[indexOfPage].jenisPenyakit,
                      borderRadius: const BorderRadius.all(Radius.zero),
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
                        : MediaQuery.of(context).size.width / 4.50,
                    padding: const EdgeInsets.only(top: 12),
                    child: DropdownButtonFormField2(
                      value: putDataRawat[indexOfPage].jenisPenanganan,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        enabled: false,
                        fillColor: grey.shade100.withAlpha(65),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: grey.shade300),
                        ),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0, color: Colors.transparent)),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 10),
                      items: jenisPenanganan
                          .map((item) => DropdownMenuItem(
                              value: putDataRawat[indexOfPage].jenisPenanganan,
                              child: Text(item)))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      buttonHeight: 50,
                      onChanged: null,
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
                                      initialValue:
                                          putDataRawat[indexOfPage].tempatLahir,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
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
                                      initialValue: putDataRawat[indexOfPage]
                                          .tanggalLahir,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
                                      keyboardType: TextInputType.none,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enabled: false,
                                      onTap: () {},
                                      readOnly: true,
                                      suffixIcon: const Icon(Icons.date_range),
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
                                    putDataRawat[indexOfPage].tempatLahir,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
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
                                    putDataRawat[indexOfPage].tanggalLahir,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                textAlignVertical: TextAlignVertical.center,
                                enabled: false,
                                onTap: () {},
                                readOnly: true,
                                suffixIcon: const Icon(Icons.date_range),
                              ),
                            ),
                          ],
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
                                    'Nomor Antrian',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Input(
                                      initialValue: putDataRawat[indexOfPage]
                                          .noAntrian!
                                          .substring(2),
                                      keyboardType: TextInputType.number,
                                      prefixText: putDataRawat[indexOfPage]
                                          .noAntrian!
                                          .substring(0, 2),
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
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
                                    'Jadwal Rawat Jalan',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Input(
                                      controller: _jadwalRawatController,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
                                      keyboardType: TextInputType.none,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enabled: valueProvider.hEdit,
                                      onTap: () {
                                        functionProvider
                                            .dateTimeJadwal(context);
                                      },
                                      readOnly: true,
                                      suffixIcon: const Icon(Icons.date_range),
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
                              'Nomor Antrian',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                initialValue: putDataRawat[indexOfPage]
                                    .noAntrian!
                                    .substring(2),
                                prefixText: putDataRawat[indexOfPage]
                                    .noAntrian!
                                    .substring(0, 2),
                                keyboardType: TextInputType.number,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                textAlignVertical: TextAlignVertical.center,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Jadwal Rawat Jalan',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Input(
                                controller: _jadwalRawatController,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                keyboardType: TextInputType.none,
                                textAlignVertical: TextAlignVertical.center,
                                enabled: valueProvider.hEdit,
                                onTap: () {
                                  functionProvider.dateTimeJadwal(context);
                                },
                                readOnly: true,
                                suffixIcon: const Icon(Icons.date_range),
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                alignment: (Responsive.isMobile(context))
                    ? Alignment.centerLeft
                    : null,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    right: (Responsive.isMobile(context)) ? 0 : 30, bottom: 10),
                child: !(Responsive.isMobile(context) ||
                        Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                    ? Row(
                        mainAxisAlignment: (Responsive.isMobile(context))
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (functionProvider.hEdit == true)
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  width: (Responsive.isMobile(context))
                                      ? MediaQuery.of(context).size.width * 0.28
                                      : 120,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        await openKeteranganRawatDokterPerawat(
                                            context,
                                            putDataRawat[indexOfPage].id ?? 0,
                                            putDataRawat[indexOfPage].nama ??
                                                '-',
                                            putDataRawat[indexOfPage]
                                                    .keterangan ??
                                                'Data Kosong');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: green.shade300,
                                      ),
                                      child: Text(
                                        'Keterangan',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                                (Responsive.isMobile(context))
                                                    ? 14
                                                    : 15),
                                      )),
                                ),
                          const SizedBox(
                            width: 20,
                          ),
                          !(loginValue.user.level == 'Dokter' ||
                                  loginValue.user.level == 'Perawat')
                              ? SizedBox(
                                  width: (Responsive.isMobile(context))
                                      ? MediaQuery.of(context).size.width * 0.28
                                      : 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      functionProvider.changeEditStatus();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: grey),
                                    child: Text(
                                      (valueProvider.hEdit == true)
                                          ? 'Cancel'
                                          : 'Edit',
                                      style: TextStyle(
                                          fontSize:
                                              (Responsive.isMobile(context))
                                                  ? 14
                                                  : 15),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.width * 0.28
                                : 120,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (valueProvider.hEdit == true) {
                                    showCaseDialog(context,
                                        title: 'Konfirmasi',
                                        label:
                                            'Apakah anda yakin ingin merubah data jadwal rawat jalan ?',
                                        onPressed: () async {
                                      Navigator.pop(context);
                                      functionProvider
                                          .updateDataApiRawatJalanAdmin(
                                              context,
                                              putDataRawat[indexOfPage].id!,
                                              RawatJalanUpdateModel(
                                                  jadwalRawatJalan:
                                                      _jadwalRawatController
                                                          .text),
                                              loadingWidget);
                                    });
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () async {
                                        functionProvider.changeEditStatus();
                                      },
                                    );
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (valueProvider.hEdit == true)
                                      ? green
                                      : primaryColor,
                                ),
                                child: Text(
                                  (valueProvider.hEdit == true)
                                      ? 'Simpan'
                                      : 'Kembali',
                                  style: TextStyle(
                                      fontSize: (Responsive.isMobile(context))
                                          ? 14
                                          : 15),
                                )),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          (valueProvider.hEdit == true)
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        await openKeteranganRawatDokterPerawat(
                                            context,
                                            putDataRawat[indexOfPage].id ?? 0,
                                            putDataRawat[indexOfPage].nama ??
                                                '-',
                                            putDataRawat[indexOfPage]
                                                    .keterangan ??
                                                'Data Kosong');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: green.shade300,
                                      ),
                                      child: Text(
                                        'Keterangan',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                                (Responsive.isMobile(context))
                                                    ? 14
                                                    : 15),
                                      )),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          !(loginValue.user.level == 'Dokter' ||
                                  loginValue.user.level == 'Perawat')
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      functionProvider.changeEditStatus();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: grey),
                                    child: Text(
                                      (valueProvider.hEdit == true)
                                          ? 'Cancel'
                                          : 'Edit',
                                      style: TextStyle(
                                          fontSize:
                                              (Responsive.isMobile(context))
                                                  ? 14
                                                  : 15),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (valueProvider.hEdit == true) {
                                    showCaseDialog(context,
                                        title: 'Konfirmasi',
                                        label:
                                            'Apakah anda yakin ingin merubah data jadwal rawat jalan ?',
                                        onPressed: () async {
                                      Navigator.pop(context);
                                      functionProvider
                                          .updateDataApiRawatJalanAdmin(
                                              context,
                                              putDataRawat[indexOfPage].id!,
                                              RawatJalanUpdateModel(
                                                  jadwalRawatJalan:
                                                      _jadwalRawatController
                                                          .text),
                                              loadingWidget);
                                    });
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () async {
                                        functionProvider.changeEditStatus();
                                      },
                                    );
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (valueProvider.hEdit == true)
                                      ? green
                                      : primaryColor,
                                ),
                                child: Text(
                                  (valueProvider.hEdit == true)
                                      ? 'Simpan'
                                      : 'Kembali',
                                  style: TextStyle(
                                      fontSize: (Responsive.isMobile(context))
                                          ? 14
                                          : 15),
                                )),
                          )
                        ],
                      ))
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
                            functionProvider.changeEditStatus();

                            Navigator.of(context).pop();
                          }),
                    ),
                    const Text(
                      'Detail Pasien Rawat Jalan',
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

Future openDetailRawatJalan(BuildContext context, query, queryPage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DetailRawatJalan(
            query: query,
            queryPage: queryPage,
          ));
}
