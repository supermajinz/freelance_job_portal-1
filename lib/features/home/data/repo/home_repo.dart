import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Categories>>> fetchCategories();
  Future<Either<Failure, List<Skills>>> fetchSkillsByCategory(int catId);
  Future<Either<Failure, List<ProjectModel>>> fetchProjectSuggestion();
  Future<Either<Failure, List<ProjectModel>>> fetchProjectMostCommon();
  //Future<Either<Failure, List<ProjectModel>>> fetshProjectMostCommon({List<int>? categoryIds, List<int>? skillIds});
}
