import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';

import '../../../projects/data/model/project_model/project_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Categories>>> fetchCategories();
  Future<Either<Failure, List<Skills>>> fetchSkillsByCategory(int catId);
   Future<Either<Failure, List<ProjectModel>>> fetchProjectSuggestion({
    Map<String, dynamic> params,
  });
   Future<Either<Failure, List<ProjectModel>>> fetchProjectMostCommon({
    Map<String, dynamic> params,
  });
}
