import 'package:ejapay/providers/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final UserProvider sut = UserProvider();

  group("User Provider", () { 
    test("Token should be empty", () {
      expect(sut.token, "");
    });

    test("Setting token should update the token", () {
      const String mockToken = "mock token";

      expect(sut.token, "");
      sut.token = mockToken;

      expect(sut.token, mockToken);
    });
  });  
}