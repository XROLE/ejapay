import 'package:dio/dio.dart';
import 'package:ejapay/utils/app_logger.dart';

class EjaInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.log("I will perform the request ==========================================>");
    super.onRequest(options, handler);
  }
}
