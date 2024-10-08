import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/offers/data/model/offers_model/offers_model.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/edit_offer_body.dart';
import 'package:go_router/go_router.dart';

class EditOffer extends StatelessWidget {
  final OffersModel offer;
  const EditOffer({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'تعدبل العرض',
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
      body: SafeArea(child: EditOfferBody(offer: offer)),
    );
  }
}
