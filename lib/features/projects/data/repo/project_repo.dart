import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/features/projects/data/model/edit_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../offers/data/model/offers_model/offers_model.dart';
import '../model/create_project_model.dart';

abstract class ProjectRepo {
  Future<Either<Failure, ProjectModel>> createProject(
      CreateProjectModel project);
  Future<Either<Failure, ProjectModel>> updateProject(
      EditProjectModel editProjectModel, int projectId);
  Future<Either<Failure, List<OffersModel>>> getOffersByProject(int projectId);
  Future<Either<Failure, Unit>> deleteProject(int projectId);
  Future<Either<Failure, Unit>> closeProject(int projectId);
  Future<Either<Failure, Unit>> acceptOffer(int offerId);
  Future<Either<Failure, Unit>> rejectOffer(int offerId);
  Future<Either<Failure, Unit>> completeProject(int projectId);
  Future<Either<Failure, Unit>> submitProject(int projectId);
}
