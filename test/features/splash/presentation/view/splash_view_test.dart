import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_management_platform/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:real_estate_management_platform/features/splash/presentation/view/splash_view.dart';

// Mock SplashCubit
class MockSplashCubit extends Mock implements SplashCubit {}

class FakeBuildContext extends Fake implements BuildContext {}

void main() {
  late MockSplashCubit mockSplashCubit;

  setUp(() {
    mockSplashCubit = MockSplashCubit();
  });

  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
  });

  Widget createSplashView() {
    return BlocProvider<SplashCubit>(
      create: (_) => mockSplashCubit,
      child: const MaterialApp(
        home: SplashView(),
      ),
    );
  }
  
}