import 'package:ejapay/data/local/payment_setting.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PaymentSettingsWidget extends StatefulWidget {
  const PaymentSettingsWidget({super.key});

  @override
  State<PaymentSettingsWidget> createState() => _PaymentSettingsWidgetState();
}

class _PaymentSettingsWidgetState extends State<PaymentSettingsWidget> {
  int id = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockedPaymentSettings.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              id = index;
            });
          },
          child: Container(
            color: id == index ? AppColors.primary.withOpacity(.25) : null,
            child: ListTile(
              title: Text(mockedPaymentSettings[index].name,
                  style: AppTextStyle.medium(
                    color: AppColors.appyBlue,
                  )),
              subtitle: Text(mockedPaymentSettings[index].desc),
            ),
          ),
        );
      },
    );
  }
}
