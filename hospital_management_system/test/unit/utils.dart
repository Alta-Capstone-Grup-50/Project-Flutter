import 'dart:io';

class Utils {
  static String readJson(String path) {
    var dir = Directory.current.path;
    return File("$dir/$path").readAsStringSync();
  }
}
