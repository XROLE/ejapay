import 'package:ejapay/domain/models/mobile_money_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MobileMoneyModel', () {
    test('fromJson constructs object correctly', () {
      final Map<String, dynamic> json = {
        'name': 'John Doe',
        'id': '1234567890',
        'phone_number': '+12345678901',
      };
      final model = MobileMoneyModel.fromJson(json);
      expect(model.name, 'John Doe');
      expect(model.id, '1234567890');
      expect(model.phoneNumber, '+12345678901');
    });

    test('toJson returns correct map', () {
      final model = MobileMoneyModel(
        name: 'John Doe',
        id: '1234567890',
        phoneNumber: '+12345678901',
      );
      final json = model.toJson();
      expect(json, {
        'name': 'John Doe',
        'id': '1234567890',
        'phone_number': '+12345678901',
      });
    });
  });
}