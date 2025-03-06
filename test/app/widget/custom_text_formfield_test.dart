import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_management_platform/app/widget/custom_text_formfield.dart';

void main() {
  late TextEditingController controller;

  setUp(() {
    controller = TextEditingController();
  });

  tearDown(() {
    controller.dispose();
  });

  testWidgets('should render CustomTextFormField correctly',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomTextFormField(
          text: 'Username',
          controller: controller,
          onPressed: () {},
        ),
      ),
    ));

    // Act
    final textFormFieldFinder = find.byType(TextFormField);
    final labelTextFinder = find.text('Username');

    // Assert
    expect(textFormFieldFinder, findsOneWidget);
    expect(labelTextFinder, findsOneWidget);
  });
}
