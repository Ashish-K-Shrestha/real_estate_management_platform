import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:real_estate_management_platform/features/auth/presentation/view/login_view.dart';
import 'package:real_estate_management_platform/features/auth/presentation/view_model/login/login_bloc.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginView Tests', () {
    late MockLoginBloc mockLoginBloc;

    setUp(() {
      mockLoginBloc = MockLoginBloc();
    });

    testWidgets('should show validation error for empty username',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: mockLoginBloc,
          child: MaterialApp(home: LoginView()), // Removed `const` here
        ),
      );

      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pump();

      // Check that validation error is shown for username
      expect(find.text('Please enter username'), findsOneWidget);
    });

    testWidgets('should show validation error for empty password',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: mockLoginBloc,
          child: MaterialApp(home: LoginView()), // Removed `const` here
        ),
      );

      // Enter username, leave password empty
      await tester.enterText(
          find.byKey(const ValueKey('username')), 'testuser');
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pump();

      // Check that validation error is shown for password
      expect(find.text('Please enter password'), findsOneWidget);
    });
  });
}
