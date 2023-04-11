import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ejapay/utils/network_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late NetWorkUtils sut;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    sut = NetWorkUtils(mockConnectivity);
  });

  group("NetworkUtil Connectivitys", () { 
    test("should return true if network is connected to user data", () async {
      const ConnectivityResult connectivityResult = ConnectivityResult.mobile;

      when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => connectivityResult);

      bool isNetworkConnected = await sut.isNetworkConncect();

      verify(() => mockConnectivity.checkConnectivity()).called(1);
      expect(isNetworkConnected, true);
    });
    test("should return true if network is connected to wifi", () async {
      const ConnectivityResult connectivityResult = ConnectivityResult.wifi;

      when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => connectivityResult);

      bool isNetworkConnected = await sut.isNetworkConncect();

      verify(() => mockConnectivity.checkConnectivity()).called(1);
      expect(isNetworkConnected, true);
    });
  });
}

class MockConnectivity extends Mock implements Connectivity{}
