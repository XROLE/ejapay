import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/local/req_header.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:ejapay/utils/app_logger.dart';

class PaymentServiceImpl implements PaymentService {
  final HttpClient httpClient;
  PaymentServiceImpl(this.httpClient);
  @override
  Future<List<PaymentMethodModel>> getPaymentMethods(String token) async {
    const String url = Endpoints.getPaymentMethods;
    Map<String, String> headers = reqHeaders;
    reqHeaders['authorization'] = "Bearer $token";

    final Response? res = await httpClient.get(url, headers: headers);
    List paymentMethodList = res?.data["data"];
    List<PaymentMethodModel> paymentMethodModelList =
        paymentMethodList.map((method) => PaymentMethodModel.fromJson(method)).toList();
    return paymentMethodModelList;
  }

  @override
  Future<List<WalletModel>> getPaymentSettings(
      {required String token, required int methodId}) async {
    final String url = Endpoints.getPaymentSettings(methodId);

    Map<String, String> headers = reqHeaders;
    reqHeaders['authorization'] = "Bearer $token";

    final Response? res = await httpClient.get(url, headers: headers);
    AppLogger.log("${res?.data['data']}");
    List wallets = res?.data['data'];
    return wallets.map((wallet) => WalletModel.fromJson(wallet)).toList();
  }
}
