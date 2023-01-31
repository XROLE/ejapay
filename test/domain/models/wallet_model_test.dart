import 'package:ejapay/domain/models/wallet_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test WalletModel class', () {
    final Map<String, dynamic> json = {
      'date_creation': 1578693600,
      'date_update': 1579693600,
      'id': 1,
      'identification': 'ABC123',
      'status': 'active',
      'fullName': 'John Doe',
      'address': '1 Main St',
      'accountName': 'johndoe',
      'imageLink': 'https://example.com/image.jpg',
      'lastUsed': 1578693600,
      'customer': 1,
      'country': 1,
      'paymentType': 1,
      'paymentMode': 1,
      'transactionType': 1,
    };

    final WalletModel model = WalletModel.fromJson(json);
    expect(model.dateCreation, json['date_creation']);
    expect(model.dateUpdate, json['date_update']);
    expect(model.id, json['id']);
    expect(model.identification, json['identification']);
    expect(model.status, json['status']);
    expect(model.fullName, json['fullName']);
    expect(model.address, json['address']);
    expect(model.accountName, json['accountName']);
    expect(model.imageLink, json['imageLink']);
    expect(model.lastUsed, json['lastUsed']);
    expect(model.customer, json['customer']);
    expect(model.country, json['country']);
    expect(model.paymentType, json['paymentType']);
    expect(model.paymentMode, json['paymentMode']);
    expect(model.transactionType, json['transactionType']);
  });

  test("fromJson() should return correct map", () {
    final Map<String, dynamic> expectedJson = {
      'date_creation': 1578693600,
      'date_update': 1579693600,
      'id': 1,
      'identification': 'ABC123',
      'status': 'active',
      'fullName': 'John Doe',
      'address': '1 Main St',
      'accountName': 'johndoe',
      'imageLink': 'https://example.com/image.jpg',
      'lastUsed': 1578693600,
      'customer': 1,
      'country': 1,
      'paymentType': 1,
      'paymentMode': 1,
      'transactionType': 1,
    };

    final walletJson = WalletModel.fromJson(expectedJson);
    expect(walletJson.toJson(), expectedJson);
  });
}
