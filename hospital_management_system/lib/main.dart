import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_system/screens/login%20screen/login_screen.dart';
import 'package:hospital_management_system/utilities/constants/color.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projek capstone alta kelompok 50',
      home: const LoginScreen(),
      theme: ThemeData(primaryColor: primaryColor),
    );
  }
}
