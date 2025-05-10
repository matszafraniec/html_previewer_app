import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_previewer_app/common/helpers/screen_measurement_helper.dart';

void main() {
  group('ScreenMeasurementHelper', () {
    testWidgets('calculateDensityIndependentPixels returns correct value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final rawPixels = 300.0;
              final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
              final expectedDips = rawPixels / devicePixelRatio;

              final result = context.calculateDensityIndependentPixels(
                rawPixels,
              );

              expect(result, expectedDips);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('calculateRawPixels returns correct value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final densityIndependentPixels = 100.0;
              final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
              final expectedRawPixels =
                  densityIndependentPixels * devicePixelRatio;

              final result = context.calculateRawPixels(
                densityIndependentPixels,
              );

              expect(result, expectedRawPixels);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
