import 'package:ejapay/data/local/mobile_money.dart';
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
      child: Scaffold(
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
                    const SizedBox(height:8),
                    AppDropDownField(
                        value: mobileMoneyList[0],
                        dropDownMenuItemList: mobileMoneyList
                            .map((mobileMoney) =>  DropdownMenuItem(
                                  child: Text(mobileMoney, style: AppTextStyle.medium(color: AppColors.appyBlue)),
                                  value: mobileMoney,
                                ))
                            .toList(),
                        onChange: (s) {
                        }),
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
                    const AppTextField(title: 'Phone number', isNumber: true,),
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
                    const AppTextField(title: "Full name",),
                    const SizedBox(height: 8),
                    Row(children: [
                      Switch(value: true, onChanged: (val){}, activeColor: AppColors.appyBlue,),
                      const SizedBox(width: 8),
                      Text("Save as payment method", style: AppTextStyle.medium(color: AppColors.appyBlue.withOpacity(.5),)),
                    ],),
                  ],
                ),
              Column(
                children: [
                  ActionButton(title: "Continue", onTap: (){}),
                  const SizedBox(height: 40),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
