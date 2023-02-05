

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class EjFlushBar {
  static showError({String? title, required String message, required BuildContext context, int? durationInSecons}) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      duration:  Duration(seconds: durationInSecons ?? 3),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }

  static showSuccess({String? title, required String message, required BuildContext context, int? durationInSecons}) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }
}