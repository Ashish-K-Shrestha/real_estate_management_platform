
import 'package:real_estate_management_platform/features/search/domain/entity/course_entity.dart';

abstract interface class ICourseDataSource {
  Future<List<CourseEntity>> getCourses();
  Future<void> createCourse(CourseEntity course);
  Future<void> deleteCourse(String id);
}
