import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _token = "";
  String get token => _token;
  set token(String val) {
    _token = val;
    notifyListeners();
  }
}
