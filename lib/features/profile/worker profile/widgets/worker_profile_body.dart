// WorkerProfile Body
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/custom_rate.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_custom_profile_card.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/bloc/review_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rating_summary/rating_summary.dart';

import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_review_card_worker.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';

class WorkerProfileBody extends StatefulWidget {
  final List<WorkerProfile> workerProfiles;
  const WorkerProfileBody({
    super.key,
    required this.workerProfiles,
  });

  @override
  State<WorkerProfileBody> createState() => _WorkerProfileBodyState();
}

class _WorkerProfileBodyState extends State<WorkerProfileBody> {
  late WorkerProfile currentProfile;
  @override
  void initState() {
    super.initState();
    currentProfile =
        widget.workerProfiles[0]; //TODO make this shared preferences
    context.read<ReviewBloc>().add(GetReview(currentProfile.id!));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.only(
                        right: SizeConfig.defaultSize! * 1,
                        left: SizeConfig.defaultSize! * 1,
                        top: SizeConfig.defaultSize! * 1,
                        bottom: SizeConfig.defaultSize! * 3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: SizeConfig.defaultSize! * 35,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const VirticalSpace(1);
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: widget.workerProfiles.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentProfile =
                                        widget.workerProfiles[index];
                                  });
                                  Navigator.pop(context);
                                },
                                child: WorkerCustomProfileCard(
                                  //TODO: on clicked changes current profile.
                                  profile: widget.workerProfiles[index],
                                  icon: Icons.edit,
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                        ),
                        const VirticalSpace(2),
                        CustomButtonGeneral(
                            onPressed: () {
                              GoRouter.of(context).push("/createWorkerProfile");
                            },
                            color: Theme.of(context).primaryColor,
                            textcolor: Colors.white,
                            text: "Add New Profile",
                            borderSide: const BorderSide(),
                            width: SizeConfig.defaultSize! * 40)
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * 1),
                child: WorkerCustomProfileCard(
                  profile: currentProfile,
                  icon: Icons.edit,
                  onPressed: () {},
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
                    margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
                    child: Text(
                      currentProfile.bio!,
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
                currentProfile.skillDtOs!.isNotEmpty
                    ? ShowChip(
                        skills: currentProfile.skillDtOs!,
                      )
                    : const SizedBox(),
                const VirticalSpace(4),
                const CustomSubTitle(
                  text: "Portfolio",
                ),
                const VirticalSpace(1.5),
                const CustomProtofolioCard(),
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
                                return CustomReviewCardWorker(
                                    rate: state.profileRates.rates[index]);
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is ReviewFaliure) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(child: Text('Not found'));
                    }
                  },
                ),
              ],
            ))
      ],
    );
  }
}
