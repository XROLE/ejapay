import 'package:ejapay/data/local/mobile_money.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:ejapay/utils/app_logger.dart';
import 'package:flutter/material.dart';

class CreateMobileMoneyViewModel extends BaseViewModel {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String _mobileMoneyType = mobileMoneyModelList[0].name;
  String get mobileMoneyType => _mobileMoneyType;
  set mobileMoneyType(String val) {
    _mobileMoneyType = val;
    notifyListeners();
  }

  bool _savePaymentMethod = true;
  bool get savePaymentMethod => _savePaymentMethod;
  set savePaymentMethod(bool val) {
    _savePaymentMethod = val;
    notifyListeners();
  }

  proceed() {
    String fullName = fullNameController.text;
    String phoneNumber = phoneNumberController.text;

    AppLogger.log("This is the fullName : $fullName");
    AppLogger.log("This is the phoneNumber : $phoneNumber");
  }
}
