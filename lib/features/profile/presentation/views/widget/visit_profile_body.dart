// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_review_card_client.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/visit_client_profile_custom_card.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/portofolio_widget.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/bloc/review_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rating_summary/rating_summary.dart';

import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/client_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/view_models/bloc/profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_review_card_worker.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../worker profile/widgets/custom_rate.dart';

class VisitProfileBody extends StatefulWidget {
  final ClientProfile visitedProfile;

  const VisitProfileBody({super.key, required this.visitedProfile});

  @override
  State<VisitProfileBody> createState() => _VisitProfileBodyState();
}

class _VisitProfileBodyState extends State<VisitProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomTitle(
            text:
                '${widget.visitedProfile.userDto!.firstname} ${widget.visitedProfile.userDto!.lastname}',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: ListView(
        children: [
          const VirticalSpace(5),
          InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 1),
                  child: VisitCustomProfileCard(
                    profile: widget.visitedProfile,
                  ))),
          Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 5,
                  right: SizeConfig.defaultSize! * 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSubTitle(text: "الوصف"),
                  const VirticalSpace(1),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 7,
                    child: Container(
                      margin:
                          EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
                      child: Text(
                        widget.visitedProfile.bio!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  const VirticalSpace(1),
                  InkWell(
                    onTap: () {},
                    child: Text("", //TODO: show more?
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  ),
                  const VirticalSpace(4),
                  const CustomSubTitle(
                    text: "المهارات",
                  ),
                  const VirticalSpace(.5),
                  widget.visitedProfile.skillDtOs!.isNotEmpty
                      ? ShowChip(
                          skills: widget.visitedProfile.skillDtOs!,
                        )
                      : const SizedBox(),
                  const VirticalSpace(4),
                  const CustomSubTitle(
                    text: "Projects completed",
                  ),
                  const VirticalSpace(0.5),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 29,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const HorizintalSpace(0.3);
                      },
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomProjectCard(project: ProjectModel());
                      },
                    ),
                  ),
                  const VirticalSpace(5),
                  const CustomZzz(),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "Ratings and reviews",
                  ),
                  BlocBuilder<ReviewBloc, ReviewState>(
                    builder: (context, state) {
                      if (state is ReviewLoading) {
                        return const Center(child: CustomLoading());
                      } else if (state is GetReviewSuccess) {
                        return Column(
                          children: [
                            const VirticalSpace(4),
                            CustomRate(profileRate: state.profileRates),
                            const VirticalSpace(6),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 40,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: state.profileRates.rates.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return CustomReviewCardClient(
                                      rate: state.profileRates.rates[index]);
                                },
                              ),
                            ),
                          ],
                        );
                      } else if (state is ReviewFaliure) {
                        return Center(child: Text(state.errMessage));
                      } else {
                        return const Center(child: Text('Not Found'));
                      }
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
