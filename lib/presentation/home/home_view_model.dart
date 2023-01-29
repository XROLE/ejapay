import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:ejapay/utils/app_logger.dart';

class HomeViewModel extends BaseViewModel {
  final AuthService authService;
  HomeViewModel(this.authService);

  Future<void> init() async {
    String token = await authService.login();
    AppLogger.log("This is token  : $token");
  }
}
