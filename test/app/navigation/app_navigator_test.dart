import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_previewer_app/presentation/html_preview/html_preview_screen.dart';
import 'package:html_previewer_app/app/navigation/app_navigator.dart';

void main() {
  late AppNavigator appNavigator;

  setUp(() {
    appNavigator = const AppNavigatorImpl();
  });

  group('AppNavigatorImpl', () {
    testWidgets('navigateToHtmlPreview pushes HtmlPreviewScreen', (
      WidgetTester tester,
    ) async {
      const testHtml = '<p>Hello, World!</p>';

      await tester.pumpWidget(MaterialApp(home: Scaffold()));

      appNavigator.navigateToHtmlPreview(
        tester.element(find.byType(Scaffold)),
        html: testHtml,
      );

      await tester.pumpAndSettle();

      expect(find.byType(HtmlPreviewScreen), findsOneWidget);
    });

    testWidgets('openBottomSheet opens a bottom sheet', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold()));

      appNavigator.openBottomSheet(
        tester.element(find.byType(Scaffold)),
        builder: (context) => const Text('Bottom Sheet Content'),
      );

      await tester.pumpAndSettle();

      expect(find.text('Bottom Sheet Content'), findsOneWidget);
    });

    testWidgets('pop pops the current route', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold()));

      appNavigator.navigateToHtmlPreview(
        tester.element(find.byType(Scaffold)),
        html: '<p>Test</p>',
      );

      await tester.pumpAndSettle();

      expect(find.byType(HtmlPreviewScreen), findsOneWidget);

      appNavigator.pop(tester.element(find.byType(HtmlPreviewScreen)));

      await tester.pumpAndSettle();

      expect(find.byType(HtmlPreviewScreen), findsNothing);
    });
  });
}
