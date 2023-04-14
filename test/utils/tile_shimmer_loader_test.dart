import 'package:ejapay/utils/tile_shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test that Tile shimmer loader displays correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Material(child: TileShimmerLoader())));

    // Verify that the leading container has a height of 35 and width of 35
    final leadingContainer = find.byWidgetPredicate(
      (widget) =>
          widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration as BoxDecoration).color ==
              Colors.grey.withOpacity(.15) &&
          widget.constraints?.maxHeight == 35 &&
          widget.constraints?.maxWidth == 35,
    );
    expect(leadingContainer, findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
  });
}
