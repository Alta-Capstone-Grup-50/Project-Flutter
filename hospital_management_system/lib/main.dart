import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hospital_management_system/viewModels/manage%20viewModel/manage_viewModel.dart';
import 'package:hospital_management_system/views/manage%20account%20screen/addAccount_screen.dart';
import 'package:hospital_management_system/views/manage%20account%20screen/manage_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'models/akun_model.dart';

import '/services/perfs_service.dart';
import '/utilities/constants/color.dart';

import 'viewModels/dokter perawat viewModel/dokter_viewModel.dart';
import 'viewModels/dokter perawat viewModel/perawat_viewModel.dart';
import 'viewModels/rawatJalan viewModel/rawatJalan_viewModel.dart';
import 'viewModels/home viewModel/home_viewModel.dart';
import 'viewModels/login viewModel/login_viewModel.dart';
import 'viewModels/main layout viewModel/mainLayout_viewModel.dart';
import 'viewModels/pasien viewModel/pasien_viewModel.dart';

import 'views/home%20screen/home_screen.dart';
import 'views/login%20screen/login_screen.dart';
import 'views/tenaga kesehatan screen/dokter dan perawat/dokter_screen.dart';
import 'views/tenaga kesehatan screen/dokter dan perawat/perawat_screen.dart';
import 'views/tenaga%20kesehatan%20screen/dokterPerawat_screen.dart';
import 'views/pasien screen/pasien_screen.dart';
import 'views/rawat screen/dokter perawat screen/rawat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

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
          create: ((context) => PasienViewModel()),
        ),
        ChangeNotifierProvider(
          create: ((context) => DokterViewModel()),
        ),
        ChangeNotifierProvider(
          create: ((context) => PerawatViewModel()),
        ),
        ChangeNotifierProvider(
          create: ((context) => LoginProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => RawatJalanViewModel()),
        ),
        ChangeNotifierProvider(
          create: ((context) => HomeProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MainLayoutProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => ManageViewModel()),
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
                  return LoginScreen();
                } else {
                  return const HomeScreen();
                }
            }
          },
        ),
        onGenerateRoute: ((settings) {
          switch (settings.name) {
            case '/login':
              return PageTransition(
                child: LoginScreen(),
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
                alignment: Alignment.topCenter,
                type: PageTransitionType.size,
                settings: settings,
              );
            case '/home':
              return PageTransition(
                child: const HomeScreen(),
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
                alignment: Alignment.bottomCenter,
                type: PageTransitionType.size,
                curve: Curves.easeInOut,
                settings: settings,
              );
            case '/pasien':
              return PageTransition(
                child: const PasienScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/tenagaKesehatan':
              return PageTransition(
                child: const TenagaKesehatanScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/rawatJalan':
              return PageTransition(
                child: const RawatScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/tenagaKesehatan/dokter':
              return PageTransition(
                child: const DokterScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/tenagaKesehatan/perawat':
              return PageTransition(
                child: const PerawatScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/manage':
              return PageTransition(
                child: const ManageScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            case '/addAccount':
              return PageTransition(
                child: const AddAcountScreen(),
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                settings: settings,
              );
            default:
              return null;
          }
        }),
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
