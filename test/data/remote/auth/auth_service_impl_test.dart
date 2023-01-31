import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart' as http;

void main() {
  group("AuthServiceImpl", () {
    late AuthServiceImpl authServiceImpl;
    late HttpClient httpClient;
    setUp(() async {
      httpClient = HttpClientMock();
      authServiceImpl = AuthServiceImpl(httpClient);
      await dotenv.load(fileName: ".env");
    });

    // test('login returns correct token', () async {
    //   const String expectedToken = 'mock_token';
    //   const String url = Endpoints.login;
    //    final String log = dotenv.env["LOG"]!;
    //   final String password = dotenv.env["PASSWORD"]!;
    //   final String apiKey = dotenv.env["APIKEY"]!;
    //   final String clientId = dotenv.env["CLIENTID"]!;
    //   final String appVersion = dotenv.env["VERSION"]!;
    //   final String appPlatform = dotenv.env["PLATFORM"]!;
    //   final String client = dotenv.env["CLIENT"]!;
    //   final String language = dotenv.env["LANGUAGE"]!;

    //   Map<String, String> headers = {
    //     'api-key': apiKey,
    //     'client-id': clientId,
    //     'app-version': appVersion,
    //     'app-platform': appPlatform,
    //     'client': client,
    //     'Accept-language': language,
    //   };
    //   (httpClient as HttpClientMock).response = http.Response(
    //     data: expectedToken,
    //     statusCode: 200,
    //     requestOptions: RequestOptions(path: url, headers: headers),
    //   );
    //   final String result = await authServiceImpl.login();
    //   expect(result, expectedToken);
    // });

    // test('login throws error for non-200 response', () async {
    //   (httpClient as HttpClientMock).response = http.Response(
    //     data: 'Error',
    //     statusCode: 400,
    //     requestOptions: RequestOptions(path: "", headers: {}),
    //   );
    //   final Future<String> result = authServiceImpl.login();
    //   expect(result, throwsException);
    // });
  });
}

class HttpClientMock extends HttpClient {
  late Response response;

  @override
  Future post(String url, dynamic data, {Map<String, String>? headers}) async {
    return response;
  }
}
