import 'package:ejapay/app/core/di/service_locator.dart';
import 'package:ejapay/data/remote/auth/auth_service.dart';
import 'package:ejapay/data/remote/payment/payment_service.dart';
import 'package:ejapay/domain/models/payment_method_model.dart';
import 'package:ejapay/presentation/home/home_page.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:ejapay/providers/user_provider.dart';
import 'package:ejapay/utils/app_helpers.dart';
import 'package:ejapay/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'home_view_model_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async {
    await setUpServiceLocator();
  });

  group("HomePage", () {
    List<PaymentMethodModel> paymentMethods = [
      PaymentMethodModel(
          id: "1",
          code: "1",
          titleEn: "titleEn",
          titleFr: "titleFr",
          descriptionEn: "descriptionEn",
          descriptionFr: "descriptionFr",
          minAmount: 200,
          iconImage: "iconImage")
    ];
  });
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    final mockHomeViewModel = HomeViewModelMock();

    // Build the HomePage widget
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          home: Builder(builder: (context) {
            return ChangeNotifierProvider<HomeViewModel>(
                create: (context) => mockHomeViewModel,
                child: const HomePage());
          }),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Choose a payment method'), findsOneWidget);
    expect(find.text('Ejara Flex'), findsOneWidget);
    expect(find.text('Earnings per day'), findsOneWidget);
    expect(find.text('10,000CFA'), findsOneWidget);
    expect(find.text('Select a payment method'), findsOneWidget);
    expect(find.byType(RichText), findsAtLeastNWidgets(1));
  });
}

class HomeViewModelMock extends Mock implements HomeViewModel {}
class UserProviderMock extends Mock implements UserProvider {}

// Mock classes for dependencies
class MockAppHelpers extends AppHelpers {}
class MockAuthService extends Mock implements AuthService {}
class MockPaymentService extends Mock implements PaymentService {}
class MockUserProvider extends Mock implements UserProvider {}
class MockNetWorkUtils extends Mock implements NetWorkUtils {}

class HomePageContainer extends StatefulWidget {
  const HomePageContainer({super.key});

  @override
  State<HomePageContainer> createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}