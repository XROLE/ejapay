import 'package:ejapay/domain/models/payment_method_model.dart';

abstract class PaymentService {
  Future<List<PaymentMethodModel>> getPaymentMethods(String token);
}
