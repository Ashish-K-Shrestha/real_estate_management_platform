import 'package:dartz/dartz.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/search/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:real_estate_management_platform/features/search/domain/entity/course_entity.dart';
import 'package:real_estate_management_platform/features/search/domain/repository/course_repository.dart';

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDataSource _courseRemoteDataSource;

  CourseRemoteRepository(this._courseRemoteDataSource);

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity course) async {
    try {
      await _courseRemoteDataSource.createCourse(course);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      final courses = await _courseRemoteDataSource.getCourses();
      return Right(courses);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
