import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ejapay/utils/app_logger.dart';

class NetWorkUtils {
  final Connectivity connectivity;

  NetWorkUtils(this.connectivity);

   Future<bool> isNetworkConncect() async {
    bool isConnected = false;
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    }
    AppLogger.log("isConnected value ===========> $isConnected");
    AppLogger.log("isConnected value ===========> $connectivityResult");
    return isConnected;
  }
}