import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/categories/category.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/skill.dart';

abstract class CategorySkillRepo {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Skill>>> getSkills(int categoryId);
  Future<Either<Failure, List<JobTitle>>> getJobDesignations();
}
