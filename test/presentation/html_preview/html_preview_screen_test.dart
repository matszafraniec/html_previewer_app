import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/html_preview/html_preview_screen.dart';
import 'package:html_previewer_app/presentation/html_preview/widgets/html_preview_widget/html_preview_widget.dart';

void main() {
  group('HtmlPreviewScreen', () {
    testWidgets('renders AppBar with correct title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: HtmlPreviewScreen(html: '<p>Test HTML</p>')),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(Texts.htmlPreview), findsOneWidget);
    });

    testWidgets('renders HtmlPreviewWidget with provided HTML', (
      WidgetTester tester,
    ) async {
      const testHtml = '<p>Test HTML</p>';
      const testHtmlTextDisplay = 'Test HTML';

      await tester.pumpWidget(
        MaterialApp(home: HtmlPreviewScreen(html: testHtml)),
      );

      expect(find.byType(HtmlPreviewWidget), findsOneWidget);
      expect(find.text(testHtmlTextDisplay), findsOneWidget);
    });
  });
}
