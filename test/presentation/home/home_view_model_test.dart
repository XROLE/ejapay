import 'dart:math';

import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late final HomeViewModel homeViewModel;
  late final UserProviderMock userProviderMock;
  late final AuthServiceMock authServiceMock;
  late final PaymentServiceMock paymentServiceMock;

  setUp(() {
    authServiceMock = AuthServiceMock();
    userProviderMock = UserProviderMock();
    paymentServiceMock = PaymentServiceMock();
    homeViewModel = HomeViewModel(
        authService: authServiceMock,
        paymentService: paymentServiceMock,
        userProvider: userProviderMock);
  });

  group("Test init", () {
    test("Test login success", () async {
      // when
      const String token = "taken_value";
      const List<PaymentMethodModel> paymentMethods = [];
      when(() => authServiceMock.login()).thenAnswer((invocation) => Future.value(token));
      when(() => paymentServiceMock.getPaymentMethods(token))
          .thenAnswer((invocation) => Future.value(paymentMethods));

      // act
      await homeViewModel.init();

      //verify
      verify(() => authServiceMock.login()).called(1);
      verify(() => paymentServiceMock.getPaymentMethods(token)).called(1);
      expect(homeViewModel.paymentMethods, equals(paymentMethods));
      expect(homeViewModel.isLoading, false);
    });
  });
}

class AuthServiceMock extends Mock implements AuthService {}

class PaymentServiceMock extends Mock implements PaymentService {}

class UserProviderMock extends Mock implements UserProvider {}
