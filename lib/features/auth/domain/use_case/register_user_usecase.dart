import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/auth/domain/entity/auth_entity.dart';
import 'package:real_estate_management_platform/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.username,
    required this.email,
    required this.password,
    this.image,
  });


  @override
  List<Object?> get props => [username, email, password, image];
}

class RegisterUserUseCase {
  final IAuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      username: params.username,
      email: params.email,
      password: params.password,
      image: params.image,
    );
    return repository.registeruser(authEntity);
  }
}
