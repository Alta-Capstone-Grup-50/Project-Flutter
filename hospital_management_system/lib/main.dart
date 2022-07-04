import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/akun_model.dart';

import '/services/perfs_service.dart';
import '/utilities/constants/color.dart';

import 'views/home%20screen/home_screen.dart';
import 'views/login%20screen/login_screen.dart';
import 'views/tenaga kesehatan screen/dokter dan perawat/dokter_screen.dart';
import 'views/tenaga kesehatan screen/dokter dan perawat/perawat_screen.dart';
import 'views/tenaga%20kesehatan%20screen/dokterPerawat_screen.dart';
import 'views/pasien screen/pasien_screen.dart';
import 'views/rawat screen/dokter perawat screen/rawat_screen.dart';

import 'viewModels/dokter perawat viewModel/dokterPerawat_viewModel.dart';
import 'viewModels/home viewModel/home_viewModel.dart';
import 'viewModels/login viewModel/login_viewModel.dart';
import 'viewModels/main layout viewModel/mainLayout_viewModel.dart';
import 'viewModels/pasien viewModel/pasien_viewModel.dart';
import 'viewModels/rawat viewModel/rawat_viewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<AkunModel> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => PasienProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => DokterPerawatProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => LoginProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => RawatProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => HomeProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MainLayoutProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projek capstone alta kelompok 50',
        theme: ThemeData(primaryColor: primaryColor),
        home: FutureBuilder<AkunModel>(
          future: getUserData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.data!.id == null) {
                  return const LoginScreen();
                } else {
                  return const HomeScreen();
                }
            }
          },
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/pasien': (context) => const PasienScreen(),
          '/tenagaKesehatan': (context) => const TenagaKesehatanScreen(),
          '/rawatJalan': (context) => const RawatScreen(),
          '/tenagaKesehatan/dokter': (context) => const DokterScreen(),
          '/tenagaKesehatan/perawat': (context) => const PerawatScreen(),
        },
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
      ),
    );
  }
}
