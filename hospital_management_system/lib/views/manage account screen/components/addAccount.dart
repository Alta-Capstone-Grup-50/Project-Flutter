import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/createManage_model.dart';
import 'package:hospital_management_system/models/radio_model.dart';
import 'package:hospital_management_system/utilities/constants/validate.dart';
import 'package:hospital_management_system/viewModels/manage%20viewModel/manage_viewModel.dart';
import 'package:provider/provider.dart';

import '../../../utilities/common/case_dialog.dart';
import '../../../utilities/common/input.dart';
import '../../../utilities/common/progress_dialog.dart';
import '../../../utilities/constants/color.dart';
import '../../../utilities/constants/responsive.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({Key? key}) : super(key: key);

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _levelController = 'Dokter';

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'add account');

  List<RadioGroup> jenisLevel = [
    RadioGroup(index: 1, text: 'Dokter'),
    RadioGroup(index: 2, text: 'Perawat'),
    RadioGroup(index: 3, text: 'Admin'),
  ];

  @override
  Widget build(BuildContext context) {
    ManageViewModel manageValue = context.watch<ManageViewModel>();
    ManageViewModel manageFunction = context.read<ManageViewModel>();

    final ProgressDialog loadingWidget = ProgressDialog(
      context,
      isDismissible: false,
    );
    loadingWidget.style(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30));

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nama',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Input(
              controller: _namaController,
              validator: ((value) {
                validatename(value!);
                return null;
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Input(
              controller: _emailController,
              validator: ((value) {
                validateEmail(value!);
                return null;
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Input(
              controller: _passwordController,
              obscureText: manageValue.obscure,
              maxLines: 1,
              suffixIcon: IconButton(
                splashRadius: 21,
                icon: manageValue.obscure == false
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  manageFunction.changeObscure();
                },
              ),
              validator: ((value) {
                validatePassword(value!);
                return null;
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Jenis Pekerjaan',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: (!Responsive.isMobile(context))
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: jenisLevel.map((jenis) {
                      return Flexible(
                        child: RadioListTile(
                          contentPadding: const EdgeInsets.all(0),
                          value: jenis.index!,
                          groupValue: manageValue.grupValue,
                          onChanged: (int? value) {
                            manageFunction.setGroupValue(value!);

                            _levelController = jenis.text!;
                            // log(_levelController);
                          },
                          title: Text(jenis.text!),
                        ),
                      );
                    }).toList(),
                  )
                : Column(
                    children: jenisLevel.map((jenis) {
                      return RadioListTile(
                        value: jenis.index!,
                        groupValue: manageValue.grupValue,
                        onChanged: (int? value) {
                          manageFunction.setGroupValue(value!);

                          _levelController = jenis.text!;
                          // log(_levelController);
                        },
                        title: Text(jenis.text!),
                      );
                    }).toList(),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: !(Responsive.isMobile(context)) ? 40 : 20, bottom: 50),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                showCaseDialog(
                  context,
                  title: 'Buat Akun',
                  label: 'Apakah anda ingin menambahkan akun tersebut ?',
                  onPressed: () async {
                    Navigator.pop(context);
                    manageFunction.setGroupValue(1);
                    manageFunction.createAkunApi(
                        context,
                        loadingWidget,
                        CreateAccount(
                          nama: _namaController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          level: _levelController,
                        ));
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Buat Akun',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
