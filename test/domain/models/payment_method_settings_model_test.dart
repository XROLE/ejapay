import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson() should return correct values', () {
    final Map<String, dynamic> json = {
      'id': 1,
      'code': 'code',
      'title_en': 'title_en',
      'title_fr': 'title_fr',
      'description_en': 'description_en',
      'min_amount': 100,
      'description_fr': 'description_fr',
      'icon_image': 'icon_image',
    };

    final paymentMethod = PaymentMethodModel.fromJson(json);

    expect(paymentMethod.id, 1);
    expect(paymentMethod.code, 'code');
    expect(paymentMethod.titleEn, 'title_en');
    expect(paymentMethod.titleFr, 'title_fr');
    expect(paymentMethod.descriptionEn, 'description_en');
    expect(paymentMethod.minAmount, 100);
    expect(paymentMethod.descriptionFr, 'description_fr');
    expect(paymentMethod.iconImage, 'icon_image');
  });

  test('toJson() should return correct map', () {
    final Map<String, dynamic> expectedJson = {
      'id': 1,
      'code': 'code',
      'title_en': 'title_en',
      'title_fr': 'title_fr',
      'description_en': 'description_en',
      'min_amount': 100,
      'description_fr': 'description_fr',
      'icon_image': 'icon_image',
    };
    
    final paymentMethod = PaymentMethodModel.fromJson(expectedJson);

    expect(paymentMethod.toJson(), expectedJson);
  });
}