import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_previewer_app/common/consts.dart';
import 'package:html_previewer_app/common/dimensions.dart';
import 'package:html_previewer_app/common/helpers/height_measurement_mixin.dart';
import 'package:html_previewer_app/common/helpers/screen_measurement_helper.dart';
import 'package:html_previewer_app/common/texts.dart';
import 'package:html_previewer_app/presentation/html_preview/widgets/html_preview_widget/childs/animation_enabler.dart';
import 'package:html_previewer_app/presentation/html_preview/widgets/html_preview_widget/childs/blur_box.dart';
import 'package:html_previewer_app/presentation/html_preview/widgets/html_preview_widget/childs/shrink_expand_button.dart';

class HtmlPreviewWidget extends StatefulWidget {
  final String html;

  const HtmlPreviewWidget(this.html, {super.key});

  @override
  State<HtmlPreviewWidget> createState() => _HtmlPreviewWidgetState();
}

sealed class SizeState {
  const SizeState();
}

class Regular extends SizeState {
  const Regular();
}

class Shrinked extends SizeState {
  const Shrinked();
}

class Expanded extends SizeState {
  const Expanded();
}

class _HtmlPreviewWidgetState extends State<HtmlPreviewWidget>
    with HeightMeasurmentMixin {
  SizeState _sizeState = Regular();

  @override
  void onHeightMeasured(height) {
    if (height > Consts.maxRegularHeight) {
      setState(() => _sizeState = Shrinked());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingS),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimationEnabler(
                isAnimationEnabled: _sizeState is! Regular,
                child: SizedBox(
                  key: key,
                  height:
                      _sizeState is Shrinked
                          ? context.calculateDensityIndependentPixels(
                            Consts.maxRegularHeight,
                          )
                          : null,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Html(data: widget.html),
                      if (_sizeState is Shrinked) const BlurBox(),
                    ],
                  ),
                ),
              ),
              switch (_sizeState) {
                Regular() => const SizedBox.shrink(),
                Shrinked() || Expanded() => ShrinkExpandButton(
                  onPressed: () {
                    _sizeState is Shrinked
                        ? setState(() => _sizeState = Expanded())
                        : setState(() => _sizeState = Shrinked());
                  },
                  text: _sizeState is Shrinked ? Texts.expand : Texts.collapse,
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
