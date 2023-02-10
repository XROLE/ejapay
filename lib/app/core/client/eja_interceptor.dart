import 'package:dio/dio.dart';
import 'package:ejapay/utils/app_logger.dart';

class EjaInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Response<Map<String, dynamic>> errorRes =
        Response(requestOptions: options, data: {"message": "Rejected querry request"});

    DioError sampleError = DioError(
      requestOptions: options,
      response: errorRes,
    );

    // Sample reject
    // handler.reject(sampleError);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options =
        RequestOptions(path: "", data: "{log: ejaraTests, password: CmKVGexi%REJjn!u65BI7PlR5}");

    // return handler.next(Response(requestOptions: options,
    //   data: [
    //     {
    //       "id": 1,
    //       "code": "MOMO",
    //       "title_en": "Mobile Money",
    //       "title_fr": "Mobile Money",
    //       "description_en": "Instantly - 3.1% Telco Fees",
    //       "min_amount": 0,
    //       "description_fr": "Instantanément - 3.1% de frais",
    //       "icon_image": ""
    //     },
    //     {
    //       "id": 2,
    //       "code": "BAC",
    //       "title_en": "Bank",
    //       "title_fr": "Banque",
    //       "description_en": "1 business Day",
    //       "min_amount": 0,
    //       "description_fr": "1 jour ouvrable",
    //       "icon_image": ""
    //     }
    //   ]
    // ));

    // return handler.next(response);
  }
}
