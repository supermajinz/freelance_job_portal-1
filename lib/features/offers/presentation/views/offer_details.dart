import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/args/offer_details_args.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/offer_details_body.dart';
import 'package:go_router/go_router.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key, required this.args});
  final OfferDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'تفاصيل العرض',
          white: true,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: CustomIconBack(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
          child: OfferDetailsBody(
        offer: args.offersModel,
        project: args.projectModel,
      )),
    );
  }
}
