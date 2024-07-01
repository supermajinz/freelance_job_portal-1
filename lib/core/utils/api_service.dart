// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';

class ApiService {
  final _baseUrl = 'https://35d3-45-14-71-11.ngrok-free.app/api/v1/';
  final Dio dio;
  ApiService({ 
    required this.dio,
  });
  Future<Map<String, dynamic>> post({required String endPoint,required User user}) async {
    var response = await dio.post('$_baseUrl$endPoint', data: user);
    return response.data;
  }
}
