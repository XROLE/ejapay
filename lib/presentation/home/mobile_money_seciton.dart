import 'package:ejapay/app/core/di/service_locator.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/presentation/base/base_view.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/presentation/mobile_money/create_mobile_money.dart';
import 'package:ejapay/presentation/widgets/action_button.dart';
import 'package:ejapay/presentation/widgets/payment_settings_widget.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileMoneySection extends StatelessWidget {
  final int paymentMethodId;
  const MobileMoneySection({required this.paymentMethodId, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseView<HomeViewModel>(
        model: HomeViewModel(
          appHelpers: sl.get<AppHelpers>(),
            authService: sl.get<AuthService>(), paymentService: sl.get<PaymentService>(), userProvider: context.read<UserProvider>()),
        onModelReady: (model) => model.getPaymentSetting(paymentMethodId),
        builder: (context, model, _) {
          return Column(
            children: [
              if(model.isFetchingPaymentSettings)
              const LinearProgressIndicator(),
              SizedBox(
                height: size.height * .28,
                child: model.paymentSettingsList.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'No payment method found, \n kindly add payment method to proceed',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : PaymentSettingsWidget(wallets: model.paymentSettingsList),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .4,
                    child: Divider(thickness: 1, color: Colors.black.withOpacity(.2)),
                  ),
                  Text(
                    "or",
                    style: AppTextStyle.medium(color: Colors.black.withOpacity(.5)),
                  ),
                  SizedBox(
                    width: size.width * .4,
                    child: Divider(thickness: 1, color: Colors.black.withOpacity(.2)),
                  ),
                ],
              ),
              SizedBox(height: size.height * .05),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateMobileMoney(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.appyBlueLight,
                      ),
                      const SizedBox(width: 5),
                      Text("Another mobile money method",
                          style: AppTextStyle.medium(
                            color: AppColors.appyBlueLight,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              ActionButton(title: "Continue", onTap: () {})
            ],
          );
        });
  }
}
