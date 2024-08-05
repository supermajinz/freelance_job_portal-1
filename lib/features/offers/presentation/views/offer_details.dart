import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/offer_details_body.dart';
import 'package:go_router/go_router.dart';

import '../../data/model/offers_model/offers_model.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key, required this.offer});
  final OffersModel offer;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'Offer Details',
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
        offer: offer,
      )),
    );
  }
}
