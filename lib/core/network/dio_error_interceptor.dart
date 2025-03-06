import 'package:dio/dio.dart';

void loginUser() async {
  var dio = Dio();
  try {
    Response response = await dio.post(
      'http://10.0.2.2:3000/api/v1/auth/login',
      data: {
        "username": "ashish",
        "password": "9818652210",
      },
      options: Options(headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }),
    );
    print("Login successful: ${response.data}");
  } on DioException catch (e) {
    if (e.response != null) {
      print("Login failed: ${e.response?.data}");
    } else {
      print("Error: ${e.message}");
    }
  }
}

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      // Handle server errors
      if (err.response!.statusCode! >= 300) {
        err = DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: err.response!.data['message'] ?? err.response!.statusMessage!,
          type: err.type,
        );
      } else {
        err = DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: 'Something went wrong',
          type: err.type,
        );
      }
    } else {
      // Handle connection errors
      err = DioException(
        requestOptions: err.requestOptions,
        error: 'Connection error',
        type: err.type,
      );
    }
    super.onError(err, handler);
  }
}
