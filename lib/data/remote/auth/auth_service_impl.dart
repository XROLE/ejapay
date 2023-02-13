import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/data/local/req_header.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class AuthServiceImpl implements AuthService {
  final HttpClient httpClient;
  AuthServiceImpl(this.httpClient);

  @override
  Future<String> login() async {
      const String url = Endpoints.login;
      final String log = dotenv.env["LOG"]!;
      final String password = dotenv.env["PASSWORD"]!;
      final String apiKey = dotenv.env["APIKEY"]!;
      final String clientId = dotenv.env["CLIENTID"]!;
      final String appVersion = dotenv.env["VERSION"]!;
      final String appPlatform = dotenv.env["PLATFORM"]!;
      final String client = dotenv.env["CLIENT"]!;
      final String language = dotenv.env["LANGUAGE"]!;

      Map<String, dynamic> data = {
        'log': log,
        'password': password,
      };
       Map<String, String> headers = reqHeaders;


      Response? res = await httpClient.post(url, data, headers: headers);
      String token = res?.data['token'];
      return token;
  }
}
