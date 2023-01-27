import 'package:ejapay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final Function() onTap;
  final Icon? icon;
  const NavButton({super.key, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.2),
        shape: BoxShape.circle,
      ),
      child: icon ?? Icon(Icons.arrow_back_ios, color: AppColors.appyBlue.withOpacity(.7), size: 13,),
    );
  }
}
