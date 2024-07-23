import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/create_offer_body.dart';
import 'package:go_router/go_router.dart';

class CreateOffer extends StatelessWidget {
  const CreateOffer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(
          text: 'Create Offer',
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
      body: const SafeArea(child: CreateOfferBody()),
    );
  }
}
