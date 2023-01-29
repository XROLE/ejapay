import 'package:ejapay/app/core/failure/failure.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/presentation/base/base_view_model.dart';
import 'package:ejapay/utils/app_logger.dart';
import 'package:flutter/material.dart';

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

  Future<void> init(BuildContext context) async {
    try {
      isLoading = true;
      String token = await authService.login(context);
      List<PaymentMethodModel> paymentMethodList = await paymentService.getPaymentMethods(token);
      paymentMethods = paymentMethodList;

      paymentMethodList.forEach((element) {
        print(element.toJson());
      });
      isLoading = false;
    } on Failure catch (e) {
      isLoading = false;
      AppLogger.log("Failure occured ${e.errorMessage}");
    } catch (e) {
      isLoading = false;
    }
  }
}
