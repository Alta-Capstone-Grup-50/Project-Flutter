import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/pasien/data/pasien_model.dart';
import 'package:hospital_management_system/models/pasien/update/pasien_update_model.dart';
import 'package:hospital_management_system/viewModels/login_viewModel/login_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../utilities/common/case_dialog.dart';
import '../../../utilities/common/progress_dialog.dart';
import '../../../utilities/constants/validate.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import '../../../viewModels/pasien_viewModel/pasien_viewModel.dart';

class DetailPasien extends StatefulWidget {
  DetailPasien({Key? key, required this.query, required this.queryPage})
      : super(key: key);

  DataGridCellTapDetails? query;
  int queryPage;

  @override
  State<DetailPasien> createState() => _DetailPasienState();
}

class _DetailPasienState extends State<DetailPasien> {
  final _scrollController = ScrollController();

  final TextEditingController _nikController = TextEditingController();

  final TextEditingController _namacontroller = TextEditingController();

  final TextEditingController _jenisKelController = TextEditingController();

  final TextEditingController _jenisPolController = TextEditingController();

  final TextEditingController _alamatController = TextEditingController();

  final TextEditingController _noTelController = TextEditingController();

  final TextEditingController _tempatLahController = TextEditingController();

  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nikController.dispose();
    _namacontroller.dispose();
    _jenisKelController.dispose();
    _jenisPolController.dispose();
    _alamatController.dispose();
    _noTelController.dispose();
    _tempatLahController.dispose();
    _tanggalLahirController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.query!.rowColumnIndex.rowIndex - 1;
    int indexOfPage = index + (widget.queryPage + 1) - 1;

    PasienViewModel functionProvider = context.read<PasienViewModel>();
    PasienViewModel valueProvider = context.watch<PasienViewModel>();
    LoginProvider loginValue = context.watch<LoginProvider>();

    List<PasienModel>? putDataPasien;
    if (valueProvider.search.isNotEmpty ||
        valueProvider.searchController.text.isNotEmpty) {
      putDataPasien = functionProvider.search;
    } else {
      putDataPasien = functionProvider.listPasienData;
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
                child: showDetail(context, putDataPasien, valueProvider,
                    functionProvider, loginValue, indexOfPage, loadingWidget),
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
                      if (valueProvider.hEdit == true) {
                        Future.delayed(const Duration(seconds: 1), () {
                          functionProvider.changeEditStatus();
                        });
                      }

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
      List<PasienModel> putDataPasien,
      PasienViewModel valueProvider,
      PasienViewModel functionProvider,
      LoginProvider loginValue,
      int indexOfPage,
      ProgressDialog loadingWidget) {
    _nikController.text = putDataPasien[indexOfPage].nik!;
    _namacontroller.text = putDataPasien[indexOfPage].nama!;
    _jenisKelController.text = putDataPasien[indexOfPage].jenisKelamin!;
    _jenisPolController.text = putDataPasien[indexOfPage].poli!;
    _alamatController.text = putDataPasien[indexOfPage].alamat!;
    _noTelController.text = putDataPasien[indexOfPage].noTelepon!;
    _tempatLahController.text = putDataPasien[indexOfPage].tempatLahir!;
    _tanggalLahirController.text = putDataPasien[indexOfPage].tanggalLahir!;

    if (valueProvider.dateTimeT != null) {
      _tanggalLahirController.text = formatDate(
          valueProvider.dateTimeT!, [dd, '-', mm, '-', yyyy],
          locale: const IndonesianDateLocale());
    }

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
                    'NIK',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _nikController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      enabled: (valueProvider.hEdit == true) ? true : false,
                      validator: (value) {
                        return validateForm(value!, 'NIK tidak boleh kosong!');
                      },
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
                      controller: _namacontroller,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      keyboardType: TextInputType.none,
                      enabled: (valueProvider.hEdit == true) ? true : false,
                      validator: (value) {
                        return validateForm(value!, 'Nama tidak boleh kosong!');
                      },
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
                      hint:
                          Text((putDataPasien[indexOfPage].jenisKelamin != null)
                              ? (putDataPasien[indexOfPage].jenisKelamin == 'L')
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
                          .map((item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                      buttonHeight: 50,
                      onChanged: (valueProvider.hEdit == true)
                          ? (value) {
                              if (value.toString() == 'Laki - laki') {
                                _jenisKelController.text = 'L';
                              } else if (value.toString() == 'Perempuan') {
                                _jenisKelController.text = 'P';
                              }
                            }
                          : null,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Jenis Poli',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: DropdownButtonFormField2(
                      hint: Text(putDataPasien[indexOfPage].poli!),
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
                              _jenisPolController.text = value.toString();
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
                  const Text(
                    'Alamat',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Input(
                      controller: _alamatController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      enabled: (valueProvider.hEdit == true) ? true : false,
                      validator: (value) {
                        return validateForm(
                            value!, 'Alamat tidak boleh kosong!');
                      },
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
                      controller: _noTelController,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      enabled: (valueProvider.hEdit == true) ? true : false,
                      validator: (value) {
                        return validateForm(
                            value!, 'Nomor telfon tidak boleh kosong!');
                      },
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
                                      controller: _tempatLahController,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
                                      keyboardType: TextInputType.none,
                                      enabled: (valueProvider.hEdit == true)
                                          ? true
                                          : false,
                                      validator: (value) {
                                        return validateForm(value!,
                                            'Tempat lahir tidak boleh kosong!');
                                      },
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
                                      controller: _tanggalLahirController,
                                      borderRadius:
                                          const BorderRadius.all(Radius.zero),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      enabled: (valueProvider.hEdit == true)
                                          ? true
                                          : false,
                                      suffixIcon: const Icon(Icons.date_range),
                                      onTap: () {
                                        functionProvider
                                            .dateTimeTanggal(context);
                                      },
                                      readOnly: true,
                                      validator: (value) {
                                        return validateForm(value!,
                                            'Tanggal lahir tidak boleh kosong!');
                                      },
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
                                controller: _tempatLahController,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                enabled: (valueProvider.hEdit == true)
                                    ? true
                                    : false,
                                validator: (value) {
                                  return validateForm(value!,
                                      'Tempat lahir tidak boleh kosong!');
                                },
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
                                controller: _tanggalLahirController,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero),
                                textAlignVertical: TextAlignVertical.center,
                                enabled: (valueProvider.hEdit == true)
                                    ? true
                                    : false,
                                suffixIcon: const Icon(Icons.date_range),
                                onTap: () {
                                  functionProvider.dateTimeTanggal(context);
                                },
                                readOnly: true,
                                validator: (value) {
                                  return validateForm(value!,
                                      'Tanggal lahir tidak boleh kosong!');
                                },
                              ),
                            ),
                          ],
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
                    right: (Responsive.isMobile(context)) ? 20 : 40,
                    bottom: 10),
                child: (!Responsive.isMobile(context))
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          (valueProvider.hEdit == true)
                              ? const SizedBox.shrink()
                              : (loginValue.user.level == 'Dokter' ||
                                      loginValue.user.level == 'Perawat')
                                  ? const SizedBox.shrink()
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showCaseDialog(
                                            context,
                                            title: 'Konfirmasi',
                                            label:
                                                'Apakah anda yakin ingin menghapus data ${putDataPasien[indexOfPage].nama} ?',
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              functionProvider.deletePasienData(
                                                  context,
                                                  putDataPasien[indexOfPage]
                                                      .id!,
                                                  loadingWidget);
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontSize:
                                                  (Responsive.isMobile(context))
                                                      ? 14
                                                      : 15),
                                        ),
                                      ),
                                    ),
                          const SizedBox(
                            width: 20,
                          ),
                          (loginValue.user.level == 'Dokter' ||
                                  loginValue.user.level == 'Perawat')
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
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
                                ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (valueProvider.hEdit == true) {
                                    showCaseDialog(context,
                                        title: 'Konfirmasi',
                                        label:
                                            'Apakah anda yakin ingin merubah data ${putDataPasien[indexOfPage].nama} ?',
                                        onPressed: () async {
                                      Navigator.pop(context);

                                      await functionProvider.updatePasienData(
                                          context,
                                          putDataPasien[indexOfPage].id!,
                                          PasienUpdateModel(
                                            nik: _nikController.text,
                                            nama: _namacontroller.text,
                                            alamat: _alamatController.text,
                                            jenisKelamin:
                                                _jenisKelController.text,
                                            poli: _jenisPolController.text,
                                            noTelepon: _noTelController.text,
                                            tempatLahir:
                                                _tempatLahController.text,
                                            tanggalLahir:
                                                _tanggalLahirController.text,
                                          ),
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
                                      ? green.shade400
                                      : primaryColor,
                                ),
                                child: Text(
                                  (valueProvider.hEdit == true)
                                      ? 'Simpan'
                                      : 'Kembali',
                                  style: const TextStyle(fontSize: 15),
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
                                    onPressed: () {
                                      showCaseDialog(
                                        context,
                                        title: 'Konfirmasi',
                                        label:
                                            'Apakah anda yakin ingin menghapus data ${putDataPasien[indexOfPage].nama} ?',
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          functionProvider.deletePasienData(
                                              context,
                                              putDataPasien[indexOfPage].id!,
                                              loadingWidget);
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize:
                                              (Responsive.isMobile(context))
                                                  ? 14
                                                  : 15),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          (loginValue.user.level == 'Dokter' ||
                                  loginValue.user.level == 'Perawat')
                              ? const SizedBox.shrink()
                              : SizedBox(
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
                                ),
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
                                            'Apakah anda yakin ingin merubah data ${putDataPasien[indexOfPage].nama} ?',
                                        onPressed: () async {
                                      Navigator.pop(context);

                                      await functionProvider.updatePasienData(
                                          context,
                                          putDataPasien[indexOfPage].id!,
                                          PasienUpdateModel(
                                            nik: _nikController.text,
                                            nama: _namacontroller.text,
                                            alamat: _alamatController.text,
                                            jenisKelamin:
                                                _jenisKelController.text,
                                            poli: _jenisPolController.text,
                                            noTelepon: _noTelController.text,
                                            tempatLahir:
                                                _tempatLahController.text,
                                            tanggalLahir:
                                                _tanggalLahirController.text,
                                          ),
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
                                      ? green.shade400
                                      : primaryColor,
                                ),
                                child: Text(
                                  (valueProvider.hEdit == true)
                                      ? 'Simpan'
                                      : 'Kembali',
                                  style: const TextStyle(fontSize: 15),
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
                            if (valueProvider.hEdit == true) {
                              Future.delayed(const Duration(seconds: 1), () {
                                functionProvider.changeEditStatus();
                              });
                            }
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
