String? validateEmail(String value) {
  String? _massage;
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (value.isEmpty) {
    _massage = "Username tidak boleh kosong";
  } else if (!regex.hasMatch(value)) {
    _massage = "Masukan username yang benar";
  }
  return _massage;
}

String? validatePassword(String value) {
  String? _massage;
  if (value.isEmpty) {
    _massage = "Password tidak boleh kosong";
  }
  return _massage;
}
