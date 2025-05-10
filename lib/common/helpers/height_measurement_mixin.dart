import 'package:flutter/material.dart';
import 'package:html_previewer_app/common/helpers/screen_measurement_helper.dart';

mixin HeightMeasurmentMixin<T extends StatefulWidget> on State<T> {
  final GlobalKey key = GlobalKey();

  void onHeightMeasured(double height);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getHeight());
  }

  void _getHeight() {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final rawPixelsHeight = context.calculateRawPixels(box.size.height);

      onHeightMeasured(rawPixelsHeight);
    }
  }
}
