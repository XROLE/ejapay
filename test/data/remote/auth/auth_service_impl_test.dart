import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class HttpClientMock extends Mock implements HttpClient {}
class UserProviderMock extends Mock implements UserProvider {}

void main() {
  // test('Login test', () async {
  //   HttpClientMock httpClient = HttpClientMock();
  //   UserProviderMock userProvider = UserProviderMock();
  //   BuildContext context = null;
  //   AuthServiceImpl authService = AuthServiceImpl(httpClient);

  //   when(userProvider.token).thenReturn(null);
  //   when(httpClient.post(any, any, headers: anyNamed("headers"))).thenAnswer((_) => Future.value(Response({"token": "test_token"})));
  //   String result = await authService.login(context);

  //   expect(result, "test_token");
  //   verify(userProvider.token = "test_token");
  // });
}