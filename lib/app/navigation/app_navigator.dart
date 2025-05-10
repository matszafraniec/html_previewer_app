import 'package:flutter/material.dart';
import 'package:html_previewer_app/presentation/html_preview/html_preview_screen.dart';

abstract class AppNavigator {
  const AppNavigator();

  void navigateToHtmlPreview(BuildContext context, {required String html});

  void openBottomSheet(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    bool isScrollControlled = false,
  });

  void pop(BuildContext context) {}
}

class AppNavigatorImpl implements AppNavigator {
  const AppNavigatorImpl();

  @override
  void navigateToHtmlPreview(BuildContext context, {required String html}) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HtmlPreviewScreen(html: html)),
    );
  }

  @override
  void openBottomSheet(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
    bool isScrollControlled = false,
  }) {
    Navigator.of(context).push(
      ModalBottomSheetRoute(
        builder: builder,
        isScrollControlled: isScrollControlled,
      ),
    );
  }

  @override
  void pop(BuildContext context) => Navigator.of(context).pop();
}
