import 'package:ejapay/presentation/base/base_view.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/presentation/widgets/nav_button.dart';
import 'package:ejapay/presentation/widgets/payment_method_tile.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: NavButton(onTap: () {}),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: BaseView<HomeViewModel>(
            model: HomeViewModel(),
            builder: (context, model, _) {
              return SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Choose a payment method",
                      style: AppTextStyle.title(color: AppColors.appyBlue),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * .04),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.folder_outlined, color: Colors.white),
                    ),
                    SizedBox(height: size.height * .01),
                    Text(
                      "Ejara Flex",
                      style: AppTextStyle.subTitle(color: Colors.black.withOpacity(.4)),
                    ),
                    SizedBox(height: size.height * .03),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "20,000",
                            style: AppTextStyle.title(color: AppColors.appyBlue)),
                        TextSpan(
                            text: "CFA",
                            style: AppTextStyle.title(
                                color: AppColors.primary, fontWeight: FontWeight.w500)),
                      ]),
                    ),
                    SizedBox(height: size.height * .055),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Earnings per day",
                          style: AppTextStyle.medium(color: Colors.black.withOpacity(.4)),
                        ),
                        Text(
                          "10,000CFA",
                          style: AppTextStyle.medium(color: Colors.black.withOpacity(.4)),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .045),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select a payment method",
                        style: AppTextStyle.subTitle(),
                      ),
                    ),
                    SizedBox(height: size.height * .015),
                    const PaymentMethodTile(
                      title: "Cash payment",
                      subTitle: "Fees Other",
                    ),
                    const PaymentMethodTile(
                      title: "Mobile money",
                      subTitle: "Fees 200CFA",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Bank transfer",
                      subTitle: "Fees variable",
                      icon: Icons.account_balance_outlined,
                    ),
                    const PaymentMethodTile(
                      title: "Credit card",
                      subTitle: "Fees variable",
                      icon: Icons.aspect_ratio_rounded,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                    const PaymentMethodTile(
                      title: "Crypto-currency",
                      subTitle: "Fees",
                      icon: Icons.ad_units_sharp,
                    ),
                  ],
                ),
              ));
            }));
  }
}
