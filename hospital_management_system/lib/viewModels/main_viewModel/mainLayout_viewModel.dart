import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainLayoutProvider extends ChangeNotifier {
  bool _menuShown = false;
  bool _isVisible = false;
  bool connected = true;
  bool _action = false;

  bool get menuShown => _menuShown;
  bool get isVisible => _isVisible;

  // void checkConnection() async {
  //   Ping pings = Ping('google.pl');
  //   pings.stream.asBroadcastStream().listen((ping) {
  //     if (ping.response?.ttl != null) {
  //       InternetConnectionChecker().onStatusChange.listen((status) {
  //         final connected = status == InternetConnectionStatus.connected;
  //         this.connected = connected;
  //         notifyListeners();
  //       });
  //     }
  //   });
  // }

  void checkConnection() async {
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      this.connected = connected;
      notifyListeners();
    });
  }

  // void stopConnection() {
  //   Ping pings = Ping('google.pl');
  //   pings.stop();
  // }

  void changeVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void changeMenuShown() {
    _menuShown = !_menuShown;

    notifyListeners();
  }
}
