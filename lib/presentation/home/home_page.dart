import 'package:ejapay/app/core/di/service_locator.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/presentation/base/base_view.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/presentation/widgets/nav_button.dart';
import 'package:ejapay/presentation/widgets/payment_method_tile.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:ejapay/utils/ej_flushbar.dart';
import 'package:ejapay/utils/tile_shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            model: HomeViewModel(
                authService: sl.get<AuthService>(),
                paymentService: sl.get<PaymentService>(),
                userProvider: context.read<UserProvider>()),
            onModelReady: (model) => model.init(
                onError: (errorMessage) {
                  EjFlushBar.showError(message: errorMessage, context: context);
                },
                onSuccess: (s) {}),
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
                            text: "20,000", style: AppTextStyle.title(color: AppColors.appyBlue)),
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
                    model.isLoading
                        ? SizedBox(
                            height: size.height * .4,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, _) {
                                return const TileShimmerLoader();
                              },
                            ),
                          )
                        : StatefulBuilder(
                            builder: ((context, setInnerState) => SizedBox(
                                  height: size.height * .4,
                                  child: ListView.builder(
                                    itemCount: model.paymentMethods.length,
                                    itemBuilder: (context, index) {
                                      return PaymentMethodTile(
                                        title: model.paymentMethods[index].titleEn ?? "",
                                        subTitle: model.paymentMethods[index].descriptionEn ?? "",
                                        paymentMethodId: model.paymentMethods[index].id!,
                                        isFetchingPaymentSettings: model.isFetchingPaymentSettings,
                                      );
                                    },
                                  ),
                                )),
                          ),
                  ],
                ),
              ));
            }));
  }
}
