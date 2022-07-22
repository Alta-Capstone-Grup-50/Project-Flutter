import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../utilities/constants/responsive.dart';
import '../../viewModels/manage viewModel/manage_viewModel.dart';
import '/views/main%20layout/main_layout.dart';
import '/utilities/common/input.dart';
import '/utilities/constants/color.dart';
import 'components/manage_table.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManageViewModel init = context.read<ManageViewModel>();
    init.getAkunApi();
    return MainLayout(
      action: true,
      actionRoute: true,
      keyScreens: 'ManageScreen',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                    ? 70
                    : 20,
                top: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text(
                  "Manage Account",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.1
                    : (Responsive.isTablet(context) &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                        ? 70
                        : 20,
                vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Akun Dokter & Perawat',
                    style: TextStyle(
                      fontSize: (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context) &&
                                  MediaQuery.of(context).orientation ==
                                      Orientation.landscape)
                          ? 40
                          : 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
                SizedBox(
                  height: (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context) &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.landscape)
                      ? 30
                      : 20,
                ),
                (Responsive.isMobile(context))
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 45,
                        width: 176,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/addAccount');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                green.shade800),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.add_circle),
                              Text('Tambah Pasien')
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Consumer<ManageViewModel>(
                  builder: ((context, valueProvider, _) {
                    if (Theme.of(context).platform == TargetPlatform.windows ||
                        kIsWeb) {
                      return Row(
                        children: [
                          (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context) &&
                                      MediaQuery.of(context).orientation ==
                                          Orientation.landscape)
                              ? SizedBox(
                                  width: 391,
                                  height: 40,
                                  child: Input(
                                    hintText: 'Cari di sini',
                                    controller: valueProvider.searchController,
                                    onChanged: valueProvider.onSearch,
                                    backgroundColor: const Color(0xFFEBEBEB),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  height: 40,
                                  child: Input(
                                    controller: valueProvider.searchController,
                                    onChanged: valueProvider.onSearch,
                                    hintText: 'Cari di sini',
                                    backgroundColor: const Color(0xFFEBEBEB),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primaryColor,
                                    ),
                                  )),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Card(
                              color: primaryColor.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                child: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  valueProvider.keyManage.currentState!
                                      .refresh();
                                },
                              ),
                            ),
                          ),
                          const Spacer(),
                          (Responsive.isMobile(context))
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 45,
                                  width: 176,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/addAccount');
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              green.shade800),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(Icons.add_circle),
                                        Text('Tambah Account')
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context) &&
                                      MediaQuery.of(context).orientation ==
                                          Orientation.landscape)
                              ? SizedBox(
                                  width: 391,
                                  height: 40,
                                  child: Input(
                                    textInputAction: TextInputAction.done,
                                    controller: valueProvider.searchController,
                                    onChanged: valueProvider.onSearch,
                                    hintText: 'Cari di sini',
                                    backgroundColor: const Color(0xFFEBEBEB),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primaryColor,
                                    ),
                                  ))
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  height: 40,
                                  child: Input(
                                    textInputAction: TextInputAction.done,
                                    controller: valueProvider.searchController,
                                    onChanged: valueProvider.onSearch,
                                    hintText: 'Cari di sini',
                                    backgroundColor: const Color(0xFFEBEBEB),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                          const Spacer(),
                        ],
                      );
                    }
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ManageAccountTable().buildTable(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
