import 'package:dio/dio.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/app/core/failure/failure.dart';
import 'package:flutter/material.dart';

class HttpClient {
  static String baseUrl = Endpoints.baseUrl;
  static BaseOptions opts = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    contentType: 'application/json',
  );

  static Dio createDio() => Dio(opts);
  static final dio = createDio();

  Future<Response?> get(String url) async {
    debugPrint("url ==> $url");

    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      if (e.response != null && e.response?.data != null && e.response?.data['message']) {
        throw Failure(e.response?.data['message']);
      } else {
        throw Failure("Something went wrong please try again later");
      }
    } catch (e) {
      throw Failure("Something went wrong please try again later");
    }
  }

  Future post(String url, dynamic data, {Map<String, String>? headers}) async {
    debugPrint('url ============> $url');
    debugPrint(' data: ============> $data');
    debugPrint(' header: ============> $headers');
    try {
      final response = await dio.post(url, data: data, options: Options(headers: headers));
      debugPrint("Response $response");

      return response;
    } on DioError catch (e) {
      if (e.response != null && e.response?.data != null && e.response?.data['message']) {
        throw Failure(e.response?.data['message']);
      } else {
        debugPrint("Error ================> $e");
        throw Failure("Something went wrong, please try again later");
      }
    } catch (e) {
      throw Failure("Something went wrong, please try again later");
    }
  }
}
