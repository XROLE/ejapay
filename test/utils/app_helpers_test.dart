import 'package:ejapay/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Apphelpers', () {
    const String firstTestContainerTitle = "app helpers first test container";
    final Widget firstTestContainer = Container(
      key: const Key(firstTestContainerTitle),
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  child: const Text(firstTestContainerTitle),);
    testWidgets('bottomModal displays correctly when isLoading is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) => ElevatedButton(
            onPressed: () {
              AppHelpers.bottomModal(
                context: context,
                title: 'Test Title',
                isLoading: false,
                child: firstTestContainer 
              );
            },
            child: const Text('Show Bottom Modal'),
          ),
        ),
      ));

      await tester.tap(find.text('Show Bottom Modal'));
      await tester.pumpAndSettle();

      // Assert that the bottom modal is displayed correctly
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byKey(const Key(firstTestContainerTitle)), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('close bottom modal on clicking the close icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) => ElevatedButton(
            onPressed: () {
              AppHelpers.bottomModal(
                context: context,
                title: 'Test Title',
                isLoading: false,
                child: firstTestContainer 
              );
            },
            child: const Text('Show Bottom Modal'),
          ),
        ),
      ));

      await tester.tap(find.text('Show Bottom Modal'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Assert that the bottom modal is displayed correctly
      expect(find.text('Test Title'), findsNothing);
      expect(find.byIcon(Icons.close), findsNothing);
    });

  });
}