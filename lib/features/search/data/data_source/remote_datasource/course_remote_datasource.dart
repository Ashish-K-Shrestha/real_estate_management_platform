import 'package:dio/dio.dart';
import 'package:real_estate_management_platform/app/constants/api_endpoints.dart';
import 'package:real_estate_management_platform/features/search/data/data_source/course_data_source.dart';
import 'package:real_estate_management_platform/features/search/data/dto/get_all_course_dto.dart';
import 'package:real_estate_management_platform/features/search/data/model/course_api_model.dart';
import 'package:real_estate_management_platform/features/search/domain/entity/course_entity.dart';

class CourseRemoteDataSource implements ICourseDataSource {
  final Dio _dio;

  CourseRemoteDataSource(this._dio);

  @override
  Future<void> createCourse(CourseEntity course) async {
    try {
      // Convert Course Entity to Course API Model
      var courseApiModel = CourseApiModel.fromEntity(course);
      var response = await _dio.post(
        ApiEndpoints.createCourse,
        data: courseApiModel.toJson(),
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteCourse(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<List<CourseEntity>> getCourses() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllCourse);
      if (response.statusCode == 200) {
        // Convert API response to DTO
        var courseDTO = GetAllCourseDTO.fromJson(response.data);
        // Convert DTO to Entity
        return CourseApiModel.toEntityList(courseDTO.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
