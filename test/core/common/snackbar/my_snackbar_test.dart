import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management_platform/core/common/snackbar/my_snackbar.dart';

void main() {
  testWidgets('showMySnackBar displays a SnackBar with the given message', (WidgetTester tester) async {
    // Arrange
    const testMessage = 'Test SnackBar';
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => showMySnackBar(context: context, message: testMessage),
                child: const Text('Show SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Show SnackBar'));
    await tester.pump(); // Trigger SnackBar animation

    // Assert
    expect(find.text(testMessage), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
