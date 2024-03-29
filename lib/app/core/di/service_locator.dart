import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/data/remote/payment/payment_service_impl.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:ejapay/utils/network_utils.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl.get()));
  sl.registerLazySingleton<PaymentService>(() => PaymentServiceImpl(sl.get()));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetWorkUtils>(() => NetWorkUtils(sl.get()));
  sl.registerLazySingleton<AppHelpers>(() => AppHelpers());
}
