import 'package:ejapay/data/local/mobile_money.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    String apiKey = dotenv.env["APIKEY"] ?? "";
    String fullName = fullNameController.text;
    String phoneNumber = phoneNumberController.text;

    print("This is the apiKey : $apiKey");
  }
}
