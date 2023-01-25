import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/createPasien_model.dart';
import 'package:hospital_management_system/utilities/constants/validate.dart';
import 'package:provider/provider.dart';

import '../../../utilities/common/case_dialog.dart';
import '../../../utilities/common/progress_dialog.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';
import '/utilities/constants/responsive.dart';
import '/viewModels/pasien viewModel/pasien_viewModel.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({Key? key}) : super(key: key);

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final _scrollController = ScrollController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'add pasien');

  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _namacontroller = TextEditingController();
  final TextEditingController _jenisKelController = TextEditingController();
  final TextEditingController _jenisPolController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _noTelController = TextEditingController();
  final TextEditingController _tempatLahController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _jenisPenController = TextEditingController();

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
    _jenisPenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienViewModel functionProvider = context.read<PasienViewModel>();
    PasienViewModel valueProvider = context.watch<PasienViewModel>();

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
                    context, functionProvider, valueProvider, loadingWidget),
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

  Widget showDetail(BuildContext context, PasienViewModel functionProvider,
      PasienViewModel valueProvider, ProgressDialog loadingWidget) {
    if (valueProvider.dateTimeT != null) {
      _tanggalLahirController.text = formatDate(
          valueProvider.dateTimeT!, [dd, '-', mm, '-', yyyy],
          locale: const IndonesianDateLocale());
    }

    return Stack(children: [
      SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          key: _formKey,
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
                        validator: (value) {
                          return validateForm(
                              value!, 'NIK tidak boleh kosong!');
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
                        validator: (value) {
                          return validateForm(
                              value!, 'Nama tidak boleh kosong!');
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
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: grey.shade100.withAlpha(65),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(color: grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(color: grey.shade300),
                            ),
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
                          onChanged: (value) {
                            if (value.toString() == 'Laki - laki') {
                              _jenisKelController.text = 'L';
                            } else if (value.toString() == 'Perempuan') {
                              _jenisKelController.text = 'P';
                            }
                          }),
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
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
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
                        items: ['Umum', 'Gigi', 'Kandungan', 'THT']
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 30,
                        buttonHeight: 50,
                        onChanged: (value) {
                          setState(() {
                            _jenisPolController.text = value.toString();
                          });
                        },
                        validator: ((value) {
                          if (value == null) {
                            return '   Data poli tidak boleh kosong';
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Input(
                                        controller: _tempatLahController,
                                        borderRadius:
                                            const BorderRadius.all(Radius.zero),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Input(
                                        controller: _tanggalLahirController,
                                        borderRadius:
                                            const BorderRadius.all(Radius.zero),
                                        keyboardType: TextInputType.none,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        suffixIcon:
                                            const Icon(Icons.date_range),
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
                                  keyboardType: TextInputType.none,
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
                                  borderRadius:
                                      const BorderRadius.all(Radius.zero),
                                  controller: _tanggalLahirController,
                                  keyboardType: TextInputType.none,
                                  textAlignVertical: TextAlignVertical.center,
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
                    const Text(
                      'Jenis Penanganan',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          filled: true,
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
                        items: ['Rawat jalan']
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 30,
                        buttonHeight: 50,
                        onChanged: (value) {
                          setState(() {
                            _jenisPenController.text = value.toString();
                          });
                        },
                        validator: ((value) {
                          if (value == null) {
                            return '    Jenis Penanganan tidak boleh kosong';
                          }
                          return null;
                        }),
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
                    right: (Responsive.isMobile(context)) ? 20 : 40,
                    bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: grey,
                          ),
                          child: const Text(
                            'Batal',
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
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              showCaseDialog(
                                context,
                                title: 'Konfirmasi',
                                label:
                                    'Apakah anda ingin menbambahkan pasien tersebut ?',
                                onPressed: () async {
                                  Navigator.pop(context);

                                  await functionProvider.addPasienData(
                                      context,
                                      loadingWidget,
                                      CreatePasienData(
                                          nik: _nikController.text,
                                          nama: _namacontroller.text,
                                          jenisKelamin:
                                              _jenisKelController.text,
                                          poli: _jenisPolController.text,
                                          alamat: _alamatController.text,
                                          noHp: _noTelController.text,
                                          tempatLahir:
                                              _tempatLahController.text,
                                          tanggalLahir:
                                              _tanggalLahirController.text,
                                          jenisPenanganan:
                                              _jenisPenController.text));
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
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

Future openAddAccount(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AddAccount());
}
