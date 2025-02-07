import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/register_user_usecase.dart';

import 'repository.mock.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(AuthEntity(
      fName: 'Test  first Name',
      username: 'test@example.com',
      password: 'testpassword',
      image: 'test.jpg',
      lName: 'test last name',
      phone: 'test phone no.',
    ));
  });

  late RegisterUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = RegisterUseCase(mockAuthRepository);
  });

  const tParams = RegisterUserParams(
    fname: 'Alex',
    username: 'johndoe@example.com',
    password: 'password123',
    image: 'profile.jpg',
    lname: 'Sanchez',
    phone: '9876543210',
  );

  final tAuthEntity = AuthEntity(
      fName: tParams.fname,
      username: tParams.username,
      password: tParams.password,
      image: tParams.image,
      lName: tParams.lname,
      phone: tParams.phone);

  test('should call registerUser on repository with correct data', () async {
    when(() => mockAuthRepository.registerStudent(any<AuthEntity>()))
        .thenAnswer(
      (_) async => const Right<Failure, void>(null),
    );

    final result = await useCase(tParams);

    expect(result, const Right(null));
    verify(() => mockAuthRepository.registerStudent(tAuthEntity));
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when repository call fails', () async {
    when(() => mockAuthRepository.registerStudent(any<AuthEntity>()))
        .thenAnswer(
      (_) async => Left<Failure, void>(
        ApiFailure(statusCode: 500, message: 'Server Error'),
      ),
    );

    final result = await useCase(tParams);

    expect(result, Left(ApiFailure(statusCode: 500, message: 'Server Error')));
    verify(() => mockAuthRepository.registerStudent(tAuthEntity));
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return Failure when email is already in use', () async {
    when(() => mockAuthRepository.registerStudent(any<AuthEntity>()))
        .thenAnswer((_) async => Left(DuplicateEmailFailure()));

    const duplicateEmailParams = RegisterUserParams(
      fname: 'Ashish ',
      username: 'ashish',
      password: '9818652210',
      image: 'user.jpg',
      lname: 'K. Shrestha',
      phone: '9818652210',
    );

    final result = await useCase(duplicateEmailParams);

    expect(result, Left(DuplicateEmailFailure()));

    verify(() => mockAuthRepository.registerStudent(any<AuthEntity>()));
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
