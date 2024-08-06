import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';

import '../../../projects/data/model/project_model/project_model.dart';

abstract class MyProjectRepo {
  Future<Either<Failure, List<ProjectModel>>> getMyProject(int userId);
}
