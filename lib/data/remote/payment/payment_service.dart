import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/domain/models/wallet_model.dart';

abstract class PaymentService {
  Future<List<PaymentMethodModel>> getPaymentMethods(String token);
  Future<List<WalletModel>> getPaymentSettings({required String token, required methodId});
}
