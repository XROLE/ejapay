import 'package:ejapay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppDropDownField extends StatelessWidget {
  final List<DropdownMenuItem> dropDownMenuItemList;
  final String value;
  final Function(dynamic e) onChange;

  AppDropDownField(
      {required this.value,
      required this.dropDownMenuItemList,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: true,
        elevation: 3,
        icon: const SizedBox(
          height: 30,
          width: 30,
          child: Icon(Icons.keyboard_arrow_down_rounded)
          ,),

        value: value,
        items: dropDownMenuItemList,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.appyBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black.withOpacity(.1)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (val) {
          onChange(val);
        });
  }
}