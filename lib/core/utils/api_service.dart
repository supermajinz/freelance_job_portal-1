// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://35d3-45-14-71-11.ngrok-free.app/api/';
  final Dio dio;
  ApiService({ 
    required this.dio,
  });
  Future<Map<String, dynamic>> post({required String endPoint,required Map data}) async {
    var response = await dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }
}
