import 'package:flutter/material.dart';

extension ScreenMeasurementHelper on BuildContext {
  double calculateDensityIndependentPixels(double rawPixels) =>
      rawPixels / MediaQuery.devicePixelRatioOf(this);

  double calculateRawPixels(double densityIndependentPixels) =>
      densityIndependentPixels * MediaQuery.devicePixelRatioOf(this);
}
