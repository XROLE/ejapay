import 'package:flutter/material.dart';

abstract class AuthService {
  Future<String> login(BuildContext context);
}