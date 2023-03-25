import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:ejapay/utils/app_logger.dart';

class HomeViewModel extends BaseViewModel {
  final AppHelpers appHelpers;
  final AuthService authService;
  final PaymentService paymentService;
  final UserProvider userProvider;
  HomeViewModel(
      {required this.authService, required this.paymentService, required this.userProvider, required this.appHelpers});

  List<PaymentMethodModel> _paymentMethods = [];
  List<PaymentMethodModel> get paymentMethods => _paymentMethods;
  set paymentMethods(List<PaymentMethodModel> val) {
    _paymentMethods = val;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isFetchingPaymentSettings = false;
  bool get isFetchingPaymentSettings => _isFetchingPaymentSettings;
  set isFetchingPaymentSettings(bool val) {
    _isFetchingPaymentSettings = val;
    notifyListeners();
  }

  List<WalletModel> _paymentSettingsList = [];
  List<WalletModel> get paymentSettingsList => _paymentSettingsList;
  set paymentSettingsList(List<WalletModel> val) {
    _paymentSettingsList = val;
    notifyListeners();
  }

  Future<void> init({Function(String s)? onSuccess, required Function(String s) onError}) async {
    await appHelpers.isNetworkConncect();
    try {
      isLoading = true;
      String token = await authService.login();
      userProvider.token = token;
      List<PaymentMethodModel> paymentMethodList = await paymentService.getPaymentMethods(token);
      paymentMethods = paymentMethodList;
      isLoading = false;
    } on Failure catch (e) {
      isLoading = false;
      onError(e.errorMessage);
      AppLogger.log("Failure occured ${e.errorMessage}");
    } catch (e) {
      onError("Something went wrong, please try again later");
      isLoading = false;
    }
  }

  Future<void> getPaymentSetting(int id) async {
    try {
      isFetchingPaymentSettings = true;

      List<WalletModel> paymentSettings =
          await paymentService.getPaymentSettings(token: userProvider.token, methodId: id);

      paymentSettingsList = paymentSettings;
      isFetchingPaymentSettings = false;

    } on Failure catch (e) {
      AppLogger.log("error ${e.errorMessage}");
      isFetchingPaymentSettings = false;
      AppLogger.log("Error: ${e.errorMessage}");
    } catch (e) {
      AppLogger.log("Error error: $e");
      isFetchingPaymentSettings = false;
    }
  }
}
