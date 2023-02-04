import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:ejapay/utils/app_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentServiceImpl implements PaymentService {
  final HttpClient httpClient;
  PaymentServiceImpl(this.httpClient);
  @override
  Future<List<PaymentMethodModel>> getPaymentMethods(String token) async {
    const String url = Endpoints.getPaymentMethods;
    final String apiKey = dotenv.env["APIKEY"]!;
    final String clientId = dotenv.env["CLIENTID"]!;
    final String appVersion = dotenv.env["VERSION"]!;
    final String appPlatform = dotenv.env["PLATFORM"]!;
    final String client = dotenv.env["CLIENT"]!;
    final String language = dotenv.env["LANGUAGE"]!;

    Map<String, String> headers = {
      'api-key': apiKey,
      'client-id': clientId,
      'app-version': appVersion,
      'app-platform': appPlatform,
      'client': client,
      'Accept-language': language,
      'authorization': "Bearer $token"
    };

    final Response? res = await httpClient.get(url, headers: headers);
    List paymentMethodList = res?.data["data"];
    List<PaymentMethodModel> paymentMethodModelList =
        paymentMethodList.map((method) => PaymentMethodModel.fromJson(method)).toList();
    return paymentMethodModelList;
  }

  @override
  Future<List<WalletModel>> getPaymentSettings({required String token, required int methodId}) async {
    final String url = Endpoints.getPaymentSettings(methodId);
    final String apiKey = dotenv.env["APIKEY"]!;
    final String clientId = dotenv.env["CLIENTID"]!;
    final String appVersion = dotenv.env["VERSION"]!;
    final String appPlatform = dotenv.env["PLATFORM"]!;
    final String client = dotenv.env["CLIENT"]!;
    final String language = dotenv.env["LANGUAGE"]!;

    Map<String, String> headers = {
      'api-key': apiKey,
      'client-id': clientId,
      'app-version': appVersion,
      'app-platform': appPlatform,
      'client': client,
      'Accept-language': language,
      'authorization': "Bearer $token"
    };

    final Response? res = await httpClient.get(url, headers: headers);
    AppLogger.log("${res?.data['data']}");
    List wallets = res?.data['data'];
    return wallets.map((wallet) => WalletModel.fromJson(wallet)).toList();
  }
}
