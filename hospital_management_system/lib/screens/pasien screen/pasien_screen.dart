import 'package:flutter/material.dart';
import 'package:hospital_management_system/view model/pasien%20provider/pasien_provider.dart';
import 'package:hospital_management_system/screens/main%20layout/main_layout.dart';
import 'package:hospital_management_system/screens/pasien%20screen/data_table.dart';
import 'package:hospital_management_system/utilities/components/input.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:provider/provider.dart';

class PasienScreen extends StatelessWidget {
  const PasienScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      final _provider = Provider.of<PasienProvider>(context, listen: false);
      _provider.getDataApiPasien();
    });
    return MainLayout(
      action: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: const Text(
                    "Home > ",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Text("Data Pasien"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Data Pasien',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 391,
              height: 40,
              child: Input(
                hintText: 'Cari di sini',
                backgroundColor: const Color(0xFFEBEBEB),
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Consumer<PasienProvider>(
              builder: ((context, value, _) {
                final DataTableSource _data = PasienData(value.listPasienData);

                print(value.listPasienData);
                if (value.isLoading) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Card(
                      child: Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  );
                } else {
                  return PaginatedDataTable(
                    columns: const [
                      DataColumn(
                        label: Text('No'),
                      ),
                      DataColumn(
                        label: Text('NIK'),
                      ),
                      DataColumn(
                        label: Text('Nama'),
                      ),
                      DataColumn(
                        label: Text('Alamat'),
                      ),
                      DataColumn(
                        label: Text('Jenis Kelamin'),
                      ),
                      DataColumn(
                        label: Text('Jenis Penyakit'),
                      ),
                    ],
                    columnSpacing: 35,
                    horizontalMargin: 10,
                    rowsPerPage: value.listPasienData.length > 6
                        ? 6
                        : value.listPasienData.length,
                    showCheckboxColumn: false,
                    source: _data,
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
