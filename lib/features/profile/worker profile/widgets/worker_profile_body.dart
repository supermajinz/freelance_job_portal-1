// WorkerProfile Body
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_custom_profile_card.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/bloc/review_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/portofolio_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/widget/cusrom_rating_summary.dart';

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

    print("will try init");
    currentProfile = widget.workerProfiles[0]; // Set a default profile
    _loadSavedProfile(); // Trigger loading of saved profile
  }

  Future<void> _loadSavedProfile() async {
    final savedProfileId = await _loadCurrentProfileId();
    if (savedProfileId != null) {
      final savedProfile = widget.workerProfiles.firstWhere(
        (profile) => profile.id == savedProfileId,
        orElse: () => widget.workerProfiles[0],
      );
      setState(() {
        currentProfile = savedProfile;
      });
    }
    // Load portfolios after setting the current profile
    context
        .read<PortofolioBloc>()
        .add(GetPortofolios(workerProfileId: currentProfile.id!));
    context.read<ReviewBloc>().add(GetReview(currentProfile.id!, false));
  }

  Future<int?> _loadCurrentProfileId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('current_profile_id');
  }

  Future<void> _saveCurrentProfile(int profileId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('current_profile_id', profileId);
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
                                  _saveCurrentProfile(currentProfile
                                      .id!); // Save the selected profile
                                  context.read<PortofolioBloc>().add(
                                      GetPortofolios(
                                          workerProfileId: currentProfile.id!));

                                  print(
                                      "will try current profile id ${currentProfile.id}");

                                  GoRouter.of(context).pop();
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
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
                  child: Text(
                    currentProfile.bio!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 6,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
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
                Row(
                  children: [
                    const CustomSubTitle(
                      text: "ملف الأعمال السابقة",
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        print('wtf? ${currentProfile.id}');
                        GoRouter.of(context)
                            .push('/addprotofolio', extra: currentProfile.id);
                      },
                      icon: const Icon(
                          Icons.add_box_rounded), // Your desired icon
                      label: const Text('إضافة'), // Your desired text
                    )
                  ],
                ),
                const VirticalSpace(1.5),
                PortofolioWidget(
                  workerProfileId: currentProfile.id!,
                ),
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
                const CusromRatingSummary()
              ],
            ))
      ],
    );
  }
}
