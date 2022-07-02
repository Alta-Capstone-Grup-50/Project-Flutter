import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainLayoutProvider extends ChangeNotifier {
  bool _menuShown = false;
  bool _isVisible = false;
  bool connected = true;

  bool get menuShown => _menuShown;
  bool get isVisible => _isVisible;

  changeConnection() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      this.connected = connected;

      notifyListeners();
    });
  }

  changeVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  changeMenuShown() {
    _menuShown = !_menuShown;
    notifyListeners();
  }
}
