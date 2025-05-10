import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html_previewer_app/common/helpers/height_measurement_mixin.dart';

class TestWidget extends StatefulWidget {
  final void Function(double height) onHeightMeasured;

  const TestWidget({required this.onHeightMeasured, super.key});

  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget>
    with HeightMeasurmentMixin<TestWidget> {
  @override
  void onHeightMeasured(double height) {
    widget.onHeightMeasured(height);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: key, height: 100, width: 100);
  }
}

void main() {
  testWidgets('HeightMeasurementMixin measures height correctly', (
    WidgetTester tester,
  ) async {
    double? measuredHeight;

    await tester.pumpWidget(
      MaterialApp(
        home: TestWidget(onHeightMeasured: (height) => measuredHeight = height),
      ),
    );

    await tester.pumpAndSettle();

    final devicePixelRatioOf = MediaQuery.devicePixelRatioOf(
      tester.element(find.byType(TestWidget)),
    );

    expect(measuredHeight, isNotNull);
    expect(measuredHeight, equals(600 * devicePixelRatioOf));
  });
}
