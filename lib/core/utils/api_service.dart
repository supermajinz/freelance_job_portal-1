// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';

class ApiService {
  final Dio _dio;
  final AuthTokenService _authTokenService;

  ApiService(
      {required String baseUrl, required AuthTokenService authTokenService})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl)),
        _authTokenService = authTokenService {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const token =
            "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTg2NDExNjIwIiwiaWF0IjoxNzIyODQ5NDQzLCJleHAiOjE3MjI5MzU4NDN9.AL-Bn1rWGrFgiy-QHGh4udxIxfrslpO51qnvJAzOrSo";
        // final token = await _authTokenService.getToken('access_token');
        //if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
        // }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          if (await refreshToken()) {
            final options = error.requestOptions;
            final retryResponse = await _retry(options);
            return handler.resolve(retryResponse);
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.data is int) {
        return {'data': response.data};
      }
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (response.data is String) {
        // If the response is a string, wrap it in a Map
        return {'message': response.data};
      }
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> patch(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response statusCode: ${e.response?.statusCode}');
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _authTokenService.getToken('refresh_token');
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post(
        'auth/refresh-token',
        options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
      );
      await _authTokenService.saveToken(
          'access_token', response.data['access_token']);
      await _authTokenService.saveToken(
          'refresh_token', response.data['refresh_token']);
      return true;
    } catch (e) {
      await _authTokenService.deleteToken('access_token');
      await _authTokenService.deleteToken('refresh_token');
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
