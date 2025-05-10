import 'package:flutter/material.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/html_preview/widgets/html_preview_widget/html_preview_widget.dart';

class HtmlPreviewScreen extends StatelessWidget {
  final String html;

  const HtmlPreviewScreen({required this.html, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Texts.htmlPreview),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingS),
          child: HtmlPreviewWidget(html),
        ),
      ),
    );
  }
}
