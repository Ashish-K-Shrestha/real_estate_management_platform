import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_management_platform/app/usecase/usecase.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/search/domain/entity/course_entity.dart';
import 'package:real_estate_management_platform/features/search/domain/repository/course_repository.dart';

class CreateCourseParams extends Equatable {
  final String courseName;

  const CreateCourseParams({required this.courseName});

  // Empty constructor
  const CreateCourseParams.empty() : courseName = '_empty.string';

  @override
  List<Object?> get props => [courseName];
}

class CreateCourseUsecase
    implements UsecaseWithParams<void, CreateCourseParams> {
  final ICourseRepository _courseRepository;

  CreateCourseUsecase({required ICourseRepository courseRepository})
      : _courseRepository = courseRepository;

  @override
  Future<Either<Failure, void>> call(CreateCourseParams params) {
    return _courseRepository.createCourse(
      CourseEntity(courseName: params.courseName),
    );
  }
}
