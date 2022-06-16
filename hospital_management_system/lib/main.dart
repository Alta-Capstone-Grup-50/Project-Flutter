import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_system/screens/dokter%20perawat%20screen/dokterPerawat_screen.dart';
import 'package:hospital_management_system/view model/pasien%20provider/pasien_provider.dart';
import 'package:hospital_management_system/screens/pasien%20screen/pasien_screen.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';
import 'package:hospital_management_system/view%20model/dokter%20perawat%20provider/dokterPerawat_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => PasienProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => DokterPerawatProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projek capstone alta kelompok 50',
        home: const DokterPerawatScreen(),
        theme: ThemeData(primaryColor: primaryColor),
      ),
    );
  }
}
