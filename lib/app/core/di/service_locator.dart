import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl.get()));
}
