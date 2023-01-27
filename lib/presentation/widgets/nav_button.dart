import 'package:ejapay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final Function() onTap;
  final IconData? icon;
  final double? size;
  const NavButton({super.key, required this.onTap, this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon ?? Icons.arrow_back_ios,
          color: AppColors.appyBlue.withOpacity(.7),
          size: size ?? 13,
        ),
      ),
    );
  }
}
