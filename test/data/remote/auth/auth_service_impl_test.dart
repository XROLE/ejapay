import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/local/req_header.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  late MockHttpClient mockHttpClient;
  late AuthServiceImpl sut;
  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = AuthServiceImpl(mockHttpClient);
  });

  group("AuthService login", () {
    const String mockToken = "mockTken";
    const String url = Endpoints.login;
    final String log = dotenv.env["LOG"]!;
    final String password = dotenv.env["PASSWORD"]!;

    Map<String, dynamic> data = {
      'log': log,
      'password': password,
    };

    Map<String, String> headers = reqHeaders;

    test("login success", () async {
      // when
      when(() => mockHttpClient.post(url, any(), headers: headers)).thenAnswer((invocation) =>
          Future.value(
              Response(requestOptions: RequestOptions(path: url), data: {'token': mockToken})));

      //act
      final String token = await sut.login();

      // verify
      verify(() => mockHttpClient.post(any(), any(), headers: any(named: "headers"))).called(1);
      expect(token, mockToken);
    });
  });
}

class MockHttpClient extends Mock implements HttpClient {}
