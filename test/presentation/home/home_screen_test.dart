import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_previewer_app/app/navigation/app_navigator.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/home/home_screen.dart';
import 'package:html_previewer_app/presentation/home/widgets/choice_button.dart';
import 'package:html_previewer_app/presentation/home/widgets/home_header.dart';
import 'package:html_previewer_app/presentation/home/widgets/html_input_bottom_sheet/html_input_bottom_sheet.dart';
import 'package:html_previewer_app/presentation/html_preview/html_preview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  late Widget homeScreenWidget;

  setUp(() {
    homeScreenWidget = Provider<AppNavigator>(
      create: (context) => AppNavigatorImpl(),
      child: const MaterialApp(home: HomeScreen()),
    );
  });

  group('HomeScreen', () {
    testWidgets('renders HomeScreen with all widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(homeScreenWidget);

      expect(find.byType(HomeHeader), findsOneWidget);
      expect(find.byType(ChoiceButton), findsNWidgets(2));
    });

    testWidgets('tapping "Input your own HTML" opens HtmlInputBottomSheet', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(homeScreenWidget);

      await tester.tap(find.text(Texts.inputYourOwnHtml));
      await tester.pumpAndSettle();

      expect(find.byType(HtmlInputBottomSheet), findsOneWidget);
    });

    testWidgets(
      'tapping "Present predefined HTML" navigates to HtmlPreviewScreen',
      (WidgetTester tester) async {
        await tester.pumpWidget(homeScreenWidget);

        await tester.tap(find.text(Texts.presentPredefinedHtml));
        await tester.pumpAndSettle();

        expect(find.byType(HtmlPreviewScreen), findsOneWidget);
      },
    );
  });
}
