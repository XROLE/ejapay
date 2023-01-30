import 'package:ejapay/domain/models/payment_method_settings_model.dart';

List<Map<String, String>> paymentSettingsData = [
  {
    "id": "1",
    "name": "Orange Money",
    "desc": "6 96 92 09 08",
  },
  {
    "id": "2",
    "name": "MTN mobile money",
    "desc": "6 96 92 09 08",
  },
  {
    "id": "3",
    "name": "Cash Money",
    "desc": "6 96 92 09 08",
  },
];

List<PaymentMethodSettingsModel> mockedPaymentSettings =
    paymentSettingsData.map((e) => PaymentMethodSettingsModel.fromJson(e)).toList();
