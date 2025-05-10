import 'package:flutter/material.dart';
import 'package:html_previewer_app/app/navigation/app_navigator_extension.dart';
import 'package:html_previewer_app/common/consts.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/home/widgets/html_input_bottom_sheet/bottom_sheet_header.dart';
import 'package:html_previewer_app/presentation/home/widgets/html_input_bottom_sheet/go_to_preview_button.dart';

class HtmlInputBottomSheet extends StatefulWidget {
  const HtmlInputBottomSheet({super.key});

  @override
  State<HtmlInputBottomSheet> createState() => _HtmlInputBottomSheetState();
}

class _HtmlInputBottomSheetState extends State<HtmlInputBottomSheet> {
  String html = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              BottomSheetHeader(title: Texts.inputYourOwnHtml),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.paddingXM,
                    left: Dimensions.paddingM,
                    right: Dimensions.paddingM,
                    bottom: 2 * Dimensions.paddingXL,
                  ),
                  child: TextField(
                    onChanged: (value) => setState(() => html = value),
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radiusM),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (html.length > Consts.htmlMinLength)
            GoToPreviewButton(
              onPressed:
                  () => context.appNavigator.navigateToHtmlPreview(
                    context,
                    html: """
                  $html
                    """,
                  ),
            ),
        ],
      ),
    );
  }
}
