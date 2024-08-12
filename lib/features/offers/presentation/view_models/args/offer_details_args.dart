import 'package:freelance_job_portal/features/offers/data/model/offers_model/offers_model.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';

class OfferDetailsArgs {
  final OffersModel offersModel;
  final ProjectModel projectModel;

  OfferDetailsArgs({required this.offersModel, required this.projectModel});
}
