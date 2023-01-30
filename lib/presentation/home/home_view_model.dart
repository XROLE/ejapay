import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends BaseViewModel {
  final AuthService authService;
  final PaymentService paymentService;
  HomeViewModel({required this.authService, required this.paymentService});

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

  List _paymentSettingsList = [];
  List get paymentSettingsList => _paymentSettingsList;
  set paymentSettingsList(List val) {
    _paymentSettingsList = val;
    notifyListeners();
  }

  Future<void> init(BuildContext context) async {
    try {
      isLoading = true;
      String token = await authService.login(context);
      List<PaymentMethodModel> paymentMethodList = await paymentService.getPaymentMethods(token);
      paymentMethods = paymentMethodList;
      isLoading = false;
    } on Failure catch (e) {
      isLoading = false;
      AppLogger.log("Failure occured ${e.errorMessage}");
    } catch (e) {
      isLoading = false;
    }
  }

  Future<void> getPaymentSetting({required BuildContext context, required int id}) async {
    UserProvider userProvider = Provider.of(context, listen: false);
    try {
      isFetchingPaymentSettings = true;
      List paymentSettings =
          await paymentService.getPaymentSettings(token: userProvider.token, methodId: id);
      paymentSettingsList = paymentSettings;
      isFetchingPaymentSettings = false;
      
    } on Failure catch (e) {
      isFetchingPaymentSettings = false;
    } catch (e) {
      isFetchingPaymentSettings = false;
    }
  }
}
