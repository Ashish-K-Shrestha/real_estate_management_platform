import 'package:dartz/dartz.dart';
import 'package:real_estate_management_platform/app/usecase/usecase.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/search/domain/entity/course_entity.dart';
import 'package:real_estate_management_platform/features/search/domain/repository/course_repository.dart';

class GetAllCourseUsecase implements UsecaseWithoutParams<List<CourseEntity>> {
  final ICourseRepository _courseRepository;

  GetAllCourseUsecase({required ICourseRepository courseRepository})
      : _courseRepository = courseRepository;

  @override
  Future<Either<Failure, List<CourseEntity>>> call() {
    return _courseRepository.getCourses();
  }
}
