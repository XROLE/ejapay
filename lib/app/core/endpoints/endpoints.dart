class Endpoints {
  static const String baseUrl1 = "https://testbox-nellys-coin.ejaraapis.xyz/api/v1";
  static const String baseUrl2 = "https://testbox-nellys-coin.ejaraapis.xyz/api/v2";
  static const String login = "$baseUrl1/auth/login";
  static const String getPaymentMethods =
      "$baseUrl2/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy";
      static String getPaymentSettings(int paymentTypeId) => "$baseUrl1/customer/payment-settings-per-type?paymentTypeId=$paymentTypeId&countryCode=CM&transactionType=buy";
}
