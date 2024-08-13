import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/features/report/data/model/report_model.dart';
import '../../../../core/errors/failures.dart';

abstract class ReportRepo {
  Future<Either<Failure, ReportModel>> addReport(
      Map<String, dynamic> reportData);
}
