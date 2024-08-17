import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';

import '../../../projects/data/model/project_model/project_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProjectModel>>> searchProjects({
    Map<String, dynamic> params,
  });
  //  Future<Either<Failure, List<ProjectModel>>> fetchProjectSuggestion({
  //   Map<String, dynamic> params,
  // });
  //  Future<Either<Failure, List<ProjectModel>>> fetchProjectMostCommon({
  //   Map<String, dynamic> params,
  // });
}
