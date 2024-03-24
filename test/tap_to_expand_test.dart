import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

void main() {
  group('TapToExpand widget tests', () {
    testWidgets('Widget initially closed', (WidgetTester tester) async {
      // Build the TapToExpand widget with initial closed state
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: TapToExpand(
            title: Text('Title'),
            content: Text('Content'),
          ),
        ),
      ));

      // Verify that the content is not visible
      expect(find.text('Content'), findsNothing);
    });

    testWidgets('Widget expands when tapped', (WidgetTester tester) async {
      // Build the TapToExpand widget
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: TapToExpand(
            title: Text('Title'),
            content: Text('Content'),
          ),
        ),
      ));

      // Tap on the widget to expand it
      await tester.tap(find.text('Title'));
      await tester.pump();

      // Verify that the content becomes visible
      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('Widget collapses when tapped again',
        (WidgetTester tester) async {
      // Build the TapToExpand widget
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: TapToExpand(
            title: Text('Title'),
            content: Text('Content'),
          ),
        ),
      ));

      // Expand the widget
      await tester.tap(find.text('Title'));
      await tester.pump();

      // Collapse the widget by tapping again
      await tester.tap(find.text('Title'));
      await tester.pump();

      // Verify that the content becomes invisible again
      expect(find.text('Content'), findsNothing);
    });
  });
}
