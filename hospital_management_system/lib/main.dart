import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/akun_model.dart';
import '/screens/home%20screen/home_screen.dart';
import '/screens/login%20screen/login_screen.dart';
import '/services/perfs_service.dart';
import '/utilities/constants/color.dart';

import 'package:provider/provider.dart';

import 'viewModels/dokter perawat viewModel/dokterPerawat_provider.dart';
import 'viewModels/home provider/home_provider.dart';
import 'viewModels/login viewModel/login_provider.dart';
import 'viewModels/pasien viewModel/pasien_provider.dart';
import 'viewModels/rawat viewModel/rawat_provider.dart';

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
                  } else if (snapshot.data!.token == null) {
                    return const LoginScreen();
                  } else {
                    return const HomeScreen();
                  }
              }
            }),
      ),
    );
  }
}
