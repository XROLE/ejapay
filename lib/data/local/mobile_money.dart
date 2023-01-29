import 'package:ejapay/domain/models/mobile_money_model.dart';

List<Map<String, dynamic>> mobileMoneyList = [
  {"id": "1", "name": "Orange money", "phone_number": ""},
  {"id": "2", "name": "Cash money", "phone_number": ""},
  {"id": "3", "name": "Online cash", "phone_number": "Online cash"},
];

List<MobileMoneyModel> mobileMoneyModelList =
    mobileMoneyList.map((mobileMoney) => MobileMoneyModel.fromJson(mobileMoney)).toList();
