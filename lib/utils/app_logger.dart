import 'package:flutter/foundation.dart';

class AppLogger {
  static log(String? message) {
    if (!kReleaseMode) {
      print(message);
    }
  }
}
