import 'package:ejapay/app/core/client/http_client.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());
}
