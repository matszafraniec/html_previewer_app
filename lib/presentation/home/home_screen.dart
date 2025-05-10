import 'package:flutter/material.dart';
import 'package:html_previewer_app/app/navigation/app_navigator_extension.dart';
import 'package:html_previewer_app/common/consts.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/home/widgets/choice_button.dart';
import 'package:html_previewer_app/presentation/home/widgets/home_header.dart';
import 'package:html_previewer_app/presentation/home/widgets/html_input_bottom_sheet/html_input_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Dimensions.spacingM,
            children: [
              const Spacer(flex: 2),
              Expanded(child: HomeHeader()),
              const Spacer(flex: 1),
              ChoiceButton(
                title: Texts.inputYourOwnHtml,
                onPressed: () {
                  context.appNavigator.openBottomSheet(
                    context,
                    builder: (context) => HtmlInputBottomSheet(),
                  );
                },
              ),
              ChoiceButton(
                title: Texts.presentPredefinedHtml,
                onPressed:
                    () => context.appNavigator.navigateToHtmlPreview(
                      context,
                      html: Consts.preloadedHtmlSample,
                    ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
