import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const ActionButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.appyBlue, borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: AppTextStyle.subTitle(color: Colors.white),
        ),
      ),
    );
  }
}
