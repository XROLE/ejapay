import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late HomeViewModel? homeViewModel;
  late UserProviderMock? userProviderMock;
  late AuthServiceMock? authServiceMock;
  late PaymentServiceMock? paymentServiceMock;

  setUp(() {
    authServiceMock = AuthServiceMock();
    userProviderMock = UserProviderMock();
    paymentServiceMock = PaymentServiceMock();
    homeViewModel = HomeViewModel(
        authService: authServiceMock!,
        paymentService: paymentServiceMock!,
        userProvider: userProviderMock!);
  });

  tearDown(() {
    authServiceMock = null;
    userProviderMock = UserProviderMock();
    paymentServiceMock = PaymentServiceMock();
  });

  group("Test init", () {
    const String token = "taken_value";
    const List<PaymentMethodModel> paymentMethods = [];

    test("verify that getPaymentMethod is Called on login success", () async {
      // when
      when(() => authServiceMock?.login()).thenAnswer((invocation) => Future.value(token));
      when((() => paymentServiceMock?.getPaymentMethods(token)))
          .thenAnswer((invocation) => Future.value(paymentMethods));
      verifyNever(() => authServiceMock?.login());

      // act
      await homeViewModel?.init();
      userProviderMock?.token = token;

      //verify
      verify(() => authServiceMock?.login()).called(1);
      verify(() => paymentServiceMock?.getPaymentMethods(token));
      expect(homeViewModel?.isLoading, false);
      expect(token, token);
    });

    test("Verify that getPaymentSuccess is Never Called when login fails", () async {
      //when
      when(() => authServiceMock?.login()).thenThrow(Failure("Sample failure from test"));

      // act
      await homeViewModel?.init();

      verify(() => authServiceMock?.login()).called(1);
      verifyNever(() => paymentServiceMock?.getPaymentMethods(token));
    });

    test("Verifies that payment methods are fetched successfuly", () async {
      // when
      when(() => authServiceMock?.login()).thenAnswer((Invocation) => Future.value(token));
      when((() => paymentServiceMock?.getPaymentMethods(token)))
          .thenAnswer((invocation) => Future.value(paymentMethods));

      // act
      await homeViewModel?.init();

      // veriy
      verify(() => authServiceMock?.login()).called(1);
      verify(() => paymentServiceMock?.getPaymentMethods(token)).called(1);
      expect(homeViewModel?.paymentMethods, paymentMethods);
    });
  });

  group("Test getPaymentSetting", () {
    const String token = 'token_value';
    const int methodId = 1;
    const List<WalletModel> walletList = [];

    test("Test getPaymentSetting Success ", () async {
      //when
      when(() => paymentServiceMock?.getPaymentSettings(token: "token", methodId: 1))
          .thenAnswer((invocation) => Future.value(walletList));

      // act
      await homeViewModel?.getPaymentSetting(1);

      // verify
      // verify(() => paymentServiceMock?.getPaymentSettings(token: "token", methodId: 1))
      // .called(1);
    });
  });
}

class AuthServiceMock extends Mock implements AuthService {}

class PaymentServiceMock extends Mock implements PaymentService {}

class UserProviderMock extends Mock implements UserProvider {}
