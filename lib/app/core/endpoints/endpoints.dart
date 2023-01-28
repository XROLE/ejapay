class Endpoints {
  static const String baseUrl = "https://testbox-nellys-coin.ejaraapis.xyz/api/v1";
  static const String login = "$baseUrl/auth/login";
  static const String getPaymentMethods =
      "$baseUrl/marketplace/payment-types-per-country?country_code=CM&type=deposit";
      static String getPaymentSettings(String paymentTypeId) => "$baseUrl/customer/payment-settings-per-type?paymentTypeId=$paymentTypeId&countryCode=CM&transactionType=buy";
}
