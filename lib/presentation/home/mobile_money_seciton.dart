import 'package:ejapay/presentation/mobile_money/create_mobile_money.dart';
import 'package:ejapay/presentation/widgets/action_button.dart';
import 'package:ejapay/utils/app_colors.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class MobileMoneySection extends StatelessWidget {
  const MobileMoneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .28,
          child: ListView(
            children: [
              ListTile(
                title: Text("Orange Money",
                    style: AppTextStyle.medium(
                      color: AppColors.appyBlue,
                    )),
                subtitle: const Text("6 96 92 09 08"),
              ),
              ListTile(
                title: Text("MTN mobile money",
                    style: AppTextStyle.medium(
                      color: AppColors.appyBlue,
                    )),
                subtitle: const Text("6 96 92 09 08"),
              ),
              ListTile(
                title: Text("Orange Money",
                    style: AppTextStyle.medium(
                      color: AppColors.appyBlue,
                    )),
                subtitle: const Text("6 96 92 09 08"),
              ),
            ],
          ),
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
                color: AppColors.primary.withOpacity(.2), borderRadius: BorderRadius.circular(8)),
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
  }
}
