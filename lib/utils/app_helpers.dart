import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ejapay/utils/app_logger.dart';
import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppHelpers {
  static bottomModal(
      {required BuildContext context,
      required String title,
      required bool isLoading,
      Widget? child}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Container(
                height: MediaQuery.of(context).size.height * .65,
                decoration: BoxDecoration(color: Colors.black.withOpacity(.5)),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.subTitle(),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.black.withOpacity(.6),
                              )),
                        ],
                      ),
                    ),
                    isLoading
                        ? const LinearProgressIndicator()
                        : Divider(
                            thickness: 1,
                            color: Colors.black.withOpacity(.1),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: child,
                    )
                  ]),
                ),
              ),
            ));
  }
}
