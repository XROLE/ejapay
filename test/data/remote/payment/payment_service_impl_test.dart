import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/local/req_header.dart';
import 'package:ejapay/data/remote/payment/payment_service_impl.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core_mock/mock_payment_methods.dart';
import '../../../core_mock/mock_wallet.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  late MockHttpClient? mockHttpClient;
  late PaymentServiceImpl sut;

  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = PaymentServiceImpl(mockHttpClient!);
  });

  tearDown(() {
    mockHttpClient = null;
  });

  group("PaymentServiceImplementation", () {
    const mockMethodId = 1;
    const String mockToken = "token";
    final List<Map<String, dynamic>> mockWalletList = [walletJson];
    List<Map<String, dynamic>> paymentMethodList = [paymentMethodJson];

    Map<String, String> headers = reqHeaders;
    reqHeaders['authorization'] = "Bearer $mockToken";

    test("get payment settings", () async {
    final String url = Endpoints.getPaymentSettings(mockMethodId);

      when(() => mockHttpClient!.get(url, headers: headers)).thenAnswer((_) => Future.value(
          Response(requestOptions: RequestOptions(path: url), data: {"data": mockWalletList})));

      final List<WalletModel> data =
          await sut.getPaymentSettings(token: mockToken, methodId: mockMethodId);

      expect(data, isA<List<WalletModel>>());
      verify(() => mockHttpClient!.get(url, headers: headers)).called(1);
    });

    test("get payment methods", () async {
    const String url = Endpoints.getPaymentMethods;

      when(() => mockHttpClient!.get(url, headers: headers)).thenAnswer((_) => Future.value(
          Response(requestOptions: RequestOptions(path: url), data: {"data": paymentMethodList})));

      await sut.getPaymentMethods(mockToken);
      verify(() => mockHttpClient!.get(url, headers: headers)).called(1);
    });
  });
}

class MockHttpClient extends Mock implements HttpClient {}
