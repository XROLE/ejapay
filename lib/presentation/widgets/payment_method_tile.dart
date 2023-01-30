import 'package:ejapay/presentation/home/mobile_money_seciton.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subTitle;
  final int paymentMethodId;
  final bool isFetchingPaymentSettings;
  const PaymentMethodTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.paymentMethodId,
      required this.isFetchingPaymentSettings,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AppHelpers.bottomModal(
            context: context,
            title: "Select the mobile money method",
            isLoading: isFetchingPaymentSettings,
            child: MobileMoneySection(
              paymentMethodId: paymentMethodId,
            ));
      },
      child: ListTile(
        leading: Icon(
          icon ?? Icons.adjust_sharp,
          color: AppColors.primary,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: AppTextStyle.medium(color: AppColors.appyBlue.withOpacity(.7)),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: AppTextStyle.caption(color: Colors.black.withOpacity(.4)),
            ),
          ]),
        ),
      ),
    );
  }
}
