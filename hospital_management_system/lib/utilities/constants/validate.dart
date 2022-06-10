String? validateEmail(String value) {
  String? _massage;
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (value.isEmpty) {
    _massage = "Email is required";
  } else if (!regex.hasMatch(value)) {
    _massage = "Please provide a valid email";
  }
  return _massage;
}
