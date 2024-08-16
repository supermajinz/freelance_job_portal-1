import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/photo/model/photo.dart';
import 'package:freelance_job_portal/features/photo/photo_repo.dart';

class PhotoRepoImpl extends PhotoRepo {
  final ApiService _apiService;
  final String photoBaseUrl = '${DependencyInjection.baseUrl}file/photo';

  PhotoRepoImpl(this._apiService);

  @override
  Future<Either<Failure, Photo>> uploadPhoto(String imagePath) async {
    // print('repo upload image');
    // print('$imagePath');
    try {
      final file = File(imagePath);
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      });
      // print('form data ${formData.fields}');
      //print('form data ${formData.files}');

      // print('Calling _apiService.postFormData');
      final response = await _apiService.postFormData('file/photo', formData);
      // print('API Response: $response');

      if (response.containsKey('id') && response.containsKey('photo')) {
        return Right(Photo.fromJson(response));
      } else if (response.containsKey('error') &&
          response.containsKey('message')) {
        return Left(ServerFailure(errMessage: response['message']));
      } else {
        // print('Unexpected response format: $response');
        return Left(ServerFailure(errMessage: 'Unexpected response format'));
      }
    } catch (e) {
      //print('Exception in uploadPhoto: $e');
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  String getImageUrl(String imageName) {
    //print("repo: $imageName");
    return '$photoBaseUrl/$imageName';
  }
}
