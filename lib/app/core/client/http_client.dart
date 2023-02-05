import 'package:dio/dio.dart';
import 'package:ejapay/app/core/endpoints/endpoints.dart';
import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/utils/app_logger.dart';

class HttpClient {
  static String baseUrl = Endpoints.baseUrl1;
  static BaseOptions opts = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    contentType: 'application/json',
  );

  static Dio createDio() => Dio(opts);
  static final dio = createDio();

  Future<Response?> get(String url, {Map<String, String>? headers}) async {
    AppLogger.log("url ==> $url");
    AppLogger.log("header ==> $headers");

    try {
      Response response = await dio.get(url, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Failure("Looks like your internet is unstable, connection timed out");
      }
      if (e.response != null && e.response?.data != null && e.response?.data['message'] != null) {
        throw Failure(e.response?.data['message']);
      } else {
        throw Failure("Something went wrong please try again later");
      }
    } catch (e) {
      throw Failure("Something went wrong please try again later");
    }
  }

  Future post(String url, dynamic data, {Map<String, String>? headers}) async {
    AppLogger.log('url ============> $url');
    AppLogger.log(' data: ============> $data');
    AppLogger.log(' header: ============> $headers');
    try {
      Response? response = await dio.post(url, data: data, options: Options(headers: headers));
      AppLogger.log("Response $response");

      return response;
    } on DioError catch (e) {
      AppLogger.log("response ============> failed ${e.response}");

      if (e.type == DioErrorType.connectTimeout) {
        throw Failure("Looks like your internet is unstable, connection timed out");
      }

      if (e.response != null && e.response?.data != null && e.response?.data['message'] != null) {
        throw Failure(e.response?.data['message']);
      } else {
        AppLogger.log("Error ================> $e");
        throw Failure("Something went wrong, please try again later");
      }
    } catch (e) {
      AppLogger.log("catch Error ================> $e");
      throw Failure("Something went wrong, please try again later");
    }
  }
}
