import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function({String? val})? validator;
  final String title;
  final bool? isNumber;
  final Function(String val)? onChange;
  const AppTextField(
      {required this.title,
      this.controller,
      this.validator,
      this.onChange,
      this.isNumber = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber! ? const TextInputType.numberWithOptions() : null,
      onChanged: (val) => onChange != null ? onChange!(val) : () {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:  8 ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.1)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (val) => validator!(val: val),
    );
  }
}