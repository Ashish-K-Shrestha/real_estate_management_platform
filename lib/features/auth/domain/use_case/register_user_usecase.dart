import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_management_platform/app/usecase/usecase.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/auth/domain/entity/auth_entity.dart';
import 'package:real_estate_management_platform/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  // final String phone;
  // final BatchEntity batch;
  // final List<CourseEntity> courses;
  final String username;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.fname,
    required this.lname,
    // required this.phone,
    // required this.batch,
    // required this.courses,
    required this.username,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fname,
    required this.lname,
    // required this.phone,
    // required this.batch,
    // required this.courses,
    required this.username,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props =>
      [fname, lname, 
      // phone, batch, courses,
       username, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      // phone: params.phone,
      // batch: params.batch,
      // courses: params.courses,
      username: params.username,
      password: params.password,
      image: params.image,
    );
    return repository.registerStudent(authEntity);
  }
}
