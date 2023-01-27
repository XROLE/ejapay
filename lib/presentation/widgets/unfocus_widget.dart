import 'package:flutter/material.dart';

class UnfocusWidget extends StatelessWidget {
  final Widget child;
  const UnfocusWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: child);
  }
}