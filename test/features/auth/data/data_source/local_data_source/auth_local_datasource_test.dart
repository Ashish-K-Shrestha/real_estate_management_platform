import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_estate_management_platform/app/shared_prefs/token_shared_prefs.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock class for SharedPreferences
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late TokenSharedPrefs tokenSharedPrefs;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    tokenSharedPrefs = TokenSharedPrefs(mockSharedPreferences);
  });

  group('TokenSharedPrefs', () {
    const testToken = 'test_token';

    test('should save token successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.setString('token', testToken))
          .thenAnswer((_) async => true);

      // Act
      final result = await tokenSharedPrefs.saveToken(testToken);

      // Assert
      expect(result, const Right(null));
      verify(() => mockSharedPreferences.setString('token', testToken))
          .called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return token successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.getString('token'))
          .thenReturn(testToken);

      // Act
      final result = await tokenSharedPrefs.getToken();

      // Assert
      expect(result, const Right(testToken));
      verify(() => mockSharedPreferences.getString('token')).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return empty string when no token is found', () async {
      // Arrange
      when(() => mockSharedPreferences.getString('token')).thenReturn(null);

      // Act
      final result = await tokenSharedPrefs.getToken();

      // Assert
      expect(result, const Right(''));
      verify(() => mockSharedPreferences.getString('token')).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return failure when saving token fails', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenThrow(Exception('Failed to save token'));

      // Act
      final result = await tokenSharedPrefs.saveToken(testToken);

      // Assert
      expect(result, isA<Left<Failure, void>>());
    });
  });
}
