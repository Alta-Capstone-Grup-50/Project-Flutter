import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/perawat_data_model.dart';
import 'package:hospital_management_system/viewModels/dokter%20perawat%20viewModel/perawat_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../models/updatePerawat_model.dart';
import '../../../utilities/common/case_dialog.dart';
import '../../../utilities/common/progress_dialog.dart';
import '../../../viewModels/login viewModel/login_viewModel.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';

class DetailDataPerawat extends StatefulWidget {
  DetailDataPerawat({Key? key, required this.query, required this.queryPage})
      : super(key: key);

  DataGridCellTapDetails? query;
  int queryPage;

  @override
  State<DetailDataPerawat> createState() => _DetailDataPerawatState();
}

class _DetailDataPerawatState extends State<DetailDataPerawat> {
  final _scrollController = ScrollController();
  final TextEditingController _sipController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jenisKelController = TextEditingController();
  final TextEditingController _nomorTelfonController = TextEditingController();
  final TextEditingController _poliController = TextEditingController();
  final TextEditingController _jadwalPrakController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _strController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _sipController.dispose();
    _namaController.dispose();
    _jenisKelController.dispose();
    _nomorTelfonController.dispose();
    _poliController.dispose();
    _jadwalPrakController.dispose();
    _jabatanController.dispose();
    _strController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.query!.rowColumnIndex.rowIndex - 1;
    int indexOfPage = index + (widget.queryPage + 1) - 1;

    PerawatViewModel functionProvider = context.read<PerawatViewModel>();
    PerawatViewModel valueProvider = context.watch<PerawatViewModel>();
    LoginProvider loginValue = context.watch<LoginProvider>();

    List<DataPerawat>? putDataPerawat;
    if (valueProvider.search.isNotEmpty ||
        valueProvider.searchController.text.isNotEmpty) {
      putDataPerawat = valueProvider.search;
    } else {
      putDataPerawat = valueProvider.listPerawatData;
    }

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
                  right: (Responsive.isMobile(context)) ? 0 : 40),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: (Responsive.isMobile(context)) ? false : true,
                child: showDetail(
                  context,
                  putDataPerawat,
                  functionProvider,
                  valueProvider,
                  loginValue,
                  indexOfPage,
                  loadingWidget,
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
                      if (valueProvider.hEdit == false) {
                        Navigator.pop(context);
                      } else {
                        Future.delayed(const Duration(seconds: 1), () async {
                          functionProvider.changeEdit();
                        });

                        Navigator.pop(context);
                      }
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
      List<DataPerawat> putDataPerawat,
      PerawatViewModel functionProvider,
      PerawatViewModel valueProvider,
      LoginProvider loginValue,
      int indexOfPage,
      ProgressDialog loadingWidget) {
    var splitJadwal = (putDataPerawat[indexOfPage].jadwalKerja!.isNotEmpty)
        ? putDataPerawat[indexOfPage].jadwalKerja?.split(' ')
        : ['-', '-'];

    String? day = splitJadwal?[0] ?? '';
    String? hours = splitJadwal?[1] ?? '';

    _sipController.text = putDataPerawat[indexOfPage].sip!;
    _namaController.text = putDataPerawat[indexOfPage].namaPerawat!;
    _poliController.text = putDataPerawat[indexOfPage].poli!;
    _jenisKelController.text = putDataPerawat[indexOfPage].jenisKelamin!;

    _nomorTelfonController.text = putDataPerawat[indexOfPage].nomorTelfon!;
    _jabatanController.text = putDataPerawat[indexOfPage].jabatan!;

    _strController.text = putDataPerawat[indexOfPage].nomorStr!;
    _jadwalPrakController.text = putDataPerawat[indexOfPage].jadwalKerja!;

    List<String> poli = ['Umum', 'Gigi', 'THT', 'Kandungan'];

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
                    'SIPP',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _sipController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: valueProvider.hEdit,
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
                      controller: _namaController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: valueProvider.hEdit,
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: DropdownButtonFormField2(
                        hint: Text((putDataPerawat[indexOfPage]
                                .jenisKelamin!
                                .isNotEmpty)
                            ? (putDataPerawat[indexOfPage].jenisKelamin == 'L')
                                ? 'Laki - laki'
                                : 'Perempuan'
                            : ' '),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
                          enabled: valueProvider.hEdit,
                          fillColor: grey.shade100.withAlpha(65),
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
                        items: [
                          'Laki - laki',
                          'Perempuan',
                        ]
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 30,
                        buttonHeight: 50,
                        onChanged: (valueProvider.hEdit == true)
                            ? (value) {
                                if (value.toString() == 'Laki - laki') {
                                  _jenisKelController.text = 'L';
                                } else {
                                  _jenisKelController.text = 'P';
                                }
                              }
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nomor Telfon',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _nomorTelfonController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: valueProvider.hEdit,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Poli',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: DropdownButtonFormField2(
                      hint: Text(putDataPerawat[indexOfPage].poli!),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        enabled: valueProvider.hEdit,
                        fillColor: grey.shade100.withAlpha(65),
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
                      items: poli
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      buttonHeight: 50,
                      onChanged: (valueProvider.hEdit == true)
                          ? (value) {
                              _poliController.text = value.toString();
                            }
                          : null,
                      validator: ((value) {
                        if (value == null) {
                          return 'Data poli tidak boleh kosong';
                        }
                        return null;
                      }),
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
                                    'Jadwal Kerja',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: DropdownButtonFormField2(
                                      hint: Text(day),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        filled: true,
                                        enabled: valueProvider.hEdit,
                                        fillColor: grey.shade100.withAlpha(65),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.transparent)),
                                      ),
                                      buttonPadding:
                                          const EdgeInsets.only(left: 10),
                                      items: ['Senin-Sabtu']
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      iconSize: 30,
                                      buttonHeight: 50,
                                      onChanged: (valueProvider.hEdit == true)
                                          ? (value) {
                                              // log(value.toString());
                                              day = value.toString();
                                            }
                                          : null,
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: DropdownButtonFormField2(
                                      hint: Text(hours),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        filled: true,
                                        enabled: valueProvider.hEdit,
                                        fillColor: grey.shade100.withAlpha(65),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: grey.shade300),
                                        ),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.transparent)),
                                      ),
                                      buttonPadding:
                                          const EdgeInsets.only(left: 10),
                                      items: ['08.00-16.00', '17.00-01.00']
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      iconSize: 30,
                                      buttonHeight: 50,
                                      onChanged: (valueProvider.hEdit == true)
                                          ? (value) {
                                              // log(value.toString());
                                              hours = value.toString();
                                            }
                                          : null,
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
                              'Jadwal Kerja',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: DropdownButtonFormField2(
                                hint: Text(day),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  enabled: valueProvider.hEdit,
                                  fillColor: grey.shade100.withAlpha(65),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.transparent)),
                                ),
                                buttonPadding: const EdgeInsets.only(left: 10),
                                items: ['Senin-Sabtu']
                                    .map((item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                buttonHeight: 50,
                                onChanged: (valueProvider.hEdit == true)
                                    ? (value) {
                                        // log(value.toString());
                                        day = value.toString();
                                      }
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: DropdownButtonFormField2(
                                hint: Text(hours),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  enabled: valueProvider.hEdit,
                                  fillColor: grey.shade100.withAlpha(65),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: grey.shade300),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.transparent)),
                                ),
                                buttonPadding: const EdgeInsets.only(left: 10),
                                items: ['08.00-16.00', '17.00-01.00']
                                    .map((item) => DropdownMenuItem(
                                        value: item, child: Text(item)))
                                    .toList(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                buttonHeight: 50,
                                onChanged: (valueProvider.hEdit == true)
                                    ? (value) {
                                        // log(value.toString());
                                        hours = value.toString();
                                      }
                                    : null,
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Jabatan',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _jabatanController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: valueProvider.hEdit,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nomor STR (Surat Tanda Registrasi)',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _strController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: valueProvider.hEdit,
                    ),
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
                  !(loginValue.user.level == 'Dokter' ||
                          loginValue.user.level == 'Perawat')
                      ? SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                if (valueProvider.hEdit == false) {
                                  functionProvider.changeEdit();
                                } else {
                                  showCaseDialog(
                                    context,
                                    title: 'Konfirmasi',
                                    label:
                                        'Apakah anda ingin menghapus data Perawat ini ?',
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await functionProvider.deletePerawatData(
                                          context,
                                          putDataPerawat[indexOfPage].idUser!,
                                          loadingWidget);
                                      Future.delayed(const Duration(seconds: 2),
                                          () async {
                                        functionProvider.changeEdit();
                                      });
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: valueProvider.hEdit == false
                                    ? grey
                                    : Colors.red,
                              ),
                              child: Text(
                                valueProvider.hEdit == false ? 'Edit' : 'Hapus',
                                style: const TextStyle(fontSize: 15),
                              )),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (valueProvider.hEdit == false) {
                            Navigator.pop(context);
                          } else {
                            showCaseDialog(
                              context,
                              title: 'Konfirmasi',
                              label:
                                  'Apakah anda ingin mengubah data Perawat ?',
                              onPressed: () async {
                                Navigator.pop(context);
                                await functionProvider.updatePerawatData(
                                    context,
                                    putDataPerawat[indexOfPage].idUser!,
                                    UpdatePerawatModel(
                                      sip: _sipController.text,
                                      nama: _namaController.text,
                                      jenisKelamin: _jenisKelController.text,
                                      nomorTelfon: _nomorTelfonController.text,
                                      poli: _poliController.text,
                                      jadwalKerja: '$day $hours WIB',
                                      jabatan: _jabatanController.text,
                                      nomorStr: _strController.text,
                                    ),
                                    loadingWidget);
                                Future.delayed(const Duration(seconds: 2),
                                    () async {
                                  functionProvider.changeEdit();
                                });
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: valueProvider.hEdit == false
                              ? primaryColor
                              : green.shade400,
                        ),
                        child: Text(
                          valueProvider.hEdit == false ? 'Kembali' : 'Simpan',
                          style: const TextStyle(fontSize: 15),
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
                            if (valueProvider.hEdit == false) {
                              Navigator.pop(context);
                            } else {
                              Future.delayed(const Duration(seconds: 1),
                                  () async {
                                functionProvider.changeEdit();
                              });

                              Navigator.pop(context);
                            }
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

Future openDetailPerawat(BuildContext context, query, queryPage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DetailDataPerawat(
            query: query,
            queryPage: queryPage,
          ));
}
