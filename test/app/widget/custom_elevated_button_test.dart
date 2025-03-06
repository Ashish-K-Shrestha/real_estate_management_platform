import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/app/widget/custom_elevated_button.dart';
void main() {
  testWidgets('CustomElevatedButton displays text and triggers onPressed', (WidgetTester tester) async {
    // Arrange
    bool wasPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomElevatedButton(
            text: 'Click Me',
            onPressed: () => wasPressed = true,
          ),
        ),
      ),
    );

    // Assert initial state
    expect(find.text('Click Me'), findsOneWidget);
    expect(wasPressed, isFalse);

    // Act
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert button press
    expect(wasPressed, isTrue);
  });
}