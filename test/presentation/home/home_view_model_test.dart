import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:ejapay/data/remote/payment/payment_service_impl.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late HomeViewModel sut;
  late UserProviderMock userProviderMock;
  late AuthServiceImplMock authServiceImplMock;
  late PaymentServiceImplMock paymentServiceImplMock;
  late AppHelpersMock appHelpersMock;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();

    authServiceImplMock = AuthServiceImplMock();
    userProviderMock = UserProviderMock();
    paymentServiceImplMock = PaymentServiceImplMock();
    appHelpersMock = AppHelpersMock();
    
    sut = HomeViewModel(
        authService: authServiceImplMock,
        paymentService: paymentServiceImplMock,
        userProvider: userProviderMock,
        appHelpers: appHelpersMock,
        );
  });

  // tearDown(() {
  //   authServiceImplMock = null;
  //   userProviderMock = UserProviderMock();
  //   paymentServiceImplMock = PaymentServiceImplMock();
  // });

  group("Test init", () {
    const String token = "taken_value";
    const List<PaymentMethodModel> paymentMethods = [];

    test("verify that getPaymentMethod is Called on login success", () async {
      // when
      when(() => appHelpersMock.isNetworkConncect()).thenAnswer((_) async => true);
      when(() => authServiceImplMock.login()).thenAnswer((_) async => token);
      when((() => paymentServiceImplMock.getPaymentMethods(token)))
          .thenAnswer((_) async => paymentMethods);
      verifyNever(() => authServiceImplMock.login());

      // act
      await sut.init(onSuccess: null, onError: (s){});
      userProviderMock.token = token;

      //verify
      verify(() => authServiceImplMock.login()).called(1);
      verify(() => paymentServiceImplMock.getPaymentMethods(token));
      expect(sut.isLoading, false);
      expect(token, token);
    });

    test("Verify that getPaymentSuccess is Never Called when login fails", () async {
      //when
      when(() => appHelpersMock.isNetworkConncect()).thenAnswer((_) async => true);
      when(() => authServiceImplMock.login()).thenThrow(Failure("Sample failure from test"));


      // act
      await sut.init(onError: (s){}, onSuccess: (s){});

      verify(() => authServiceImplMock.login()).called(1);
      verifyNever(() => paymentServiceImplMock.getPaymentMethods(token));
    });

    test("Verifies that payment methods are fetched successfuly", () async {
      // when
      when(() => appHelpersMock.isNetworkConncect()).thenAnswer((_) async => true);
      when(() => authServiceImplMock.login()).thenAnswer((_) => Future.value(token));
      when((() => paymentServiceImplMock.getPaymentMethods(token)))
          .thenAnswer((invocation) => Future.value(paymentMethods));

      // act
      await sut.init(onError: (s){});

      // veriy
      verify(() => authServiceImplMock.login()).called(1);
      verify(() => paymentServiceImplMock.getPaymentMethods(token)).called(1);
      expect(sut.paymentMethods, paymentMethods);
    });
  });

  group("Test getPaymentSetting", () {
    const String token = 'token_value';
    const int methodId = 1;
    const List<WalletModel> walletList = [];

    test("Test getPaymentSetting Success ", () async {
      //when
      when(() => paymentServiceImplMock.getPaymentSettings(token: token, methodId: 1))
          .thenAnswer((invocation) => Future.value(walletList));

      // act
      await sut.getPaymentSetting(1);

      verify(() => paymentServiceImplMock.getPaymentSettings(token: token, methodId: 1))
      .called(1);
    });
  });
}

class AuthServiceImplMock extends Mock implements AuthServiceImpl {}

class PaymentServiceImplMock extends Mock implements PaymentServiceImpl {}

class HttpClientMock extends Mock implements HttpClient {}

class UserProviderMock extends Mock implements UserProvider {}
class AppHelpersMock extends Mock implements AppHelpers {}
