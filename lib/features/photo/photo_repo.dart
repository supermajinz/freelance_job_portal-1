import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/photo/model/photo.dart';

abstract class PhotoRepo {
  Future<Either<Failure, Photo>> uploadPhoto(String imagePath);
}
