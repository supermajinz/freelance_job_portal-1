import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/features/projects/data/model/edit_project_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../offers/data/model/offers_model/offers_model.dart';
import '../model/create_project_model.dart';

abstract class ProjectRepo {
  Future<Either<Failure, ProjectModel>> getProjectDetails(int projectId);
  Future<Either<Failure, ProjectModel>> createProject(
      CreateProjectModel project);
  Future<Either<Failure, EditProjectModel>> updateProject(
      EditProjectModel editProjectModel, int projectId);
  Future<Either<Failure, List<OffersModel>>> getOffersByProject(int projectId);
  Future<Either<Failure, Unit>> deleteProject(int projectId);
}
