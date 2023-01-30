import 'package:ejapay/data/local/mobile_money.dart';
import 'package:ejapay/presentation/base/base_view.dart';
import 'package:ejapay/presentation/mobile_money/create_mobile_money_view_model.dart';
import 'package:ejapay/presentation/widgets/action_button.dart';
import 'package:ejapay/presentation/widgets/app_drop_down.dart';
import 'package:ejapay/presentation/widgets/app_text_field.dart';
import 'package:ejapay/presentation/widgets/nav_button.dart';
import 'package:ejapay/presentation/widgets/unfocus_widget.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CreateMobileMoney extends StatefulWidget {
  const CreateMobileMoney({super.key});

  @override
  State<CreateMobileMoney> createState() => _CreateMobileMoneyState();
}

class _CreateMobileMoneyState extends State<CreateMobileMoney> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return UnfocusWidget(
      child: BaseView<CreateMobileMoneyViewModel>(
          model: CreateMobileMoneyViewModel(),
          builder: (context, model, _) {
            return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: NavButton(
                      icon: Icons.close,
                      size: 18,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: size.height * .85,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text("New mobile money",
                                  style: AppTextStyle.title(
                                    color: AppColors.appyBlue,
                                  ))),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          Text(
                            "Choose the mobile operator",
                            style: AppTextStyle.medium(
                              color: AppColors.appyBlue.withOpacity(.4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppDropDownField(
                            value: model.mobileMoneyType,
                            dropDownMenuItemList: mobileMoneyModelList
                                .map((mobileMoney) => DropdownMenuItem(
                                      value: mobileMoney.name,
                                      child: Text(
                                        mobileMoney.name,
                                        style: AppTextStyle.medium(color: AppColors.appyBlue),
                                      ),
                                    ))
                                .toList(),
                            onChange: (s) {
                              model.mobileMoneyType = s;
                            },
                          ),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          Text(
                            "Phone number",
                            style: AppTextStyle.medium(
                              color: AppColors.appyBlue.withOpacity(.4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppTextField(
                            title: 'Phone number',
                            isNumber: true,
                            controller: model.phoneNumberController,
                          ),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          Text(
                            "Full name",
                            style: AppTextStyle.medium(
                              color: AppColors.appyBlue.withOpacity(.4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AppTextField(
                            title: "Full name",
                            controller: model.fullNameController,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Switch(
                                value: model.savePaymentMethod,
                                onChanged: (val) {
                                  model.savePaymentMethod = !model.savePaymentMethod;
                                },
                                activeColor: AppColors.appyBlue,
                              ),
                              const SizedBox(width: 8),
                              Text("Save as payment method",
                                  style: AppTextStyle.medium(
                                    color: AppColors.appyBlue.withOpacity(.5),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ActionButton(
                              title: "Continue",
                              onTap: () {
                                model.proceed();
                              }),
                          const SizedBox(height: 40),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
