// WorkerProfile Body
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/visit_worker_custom_profile.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/visit_portofolio_widget.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import '../../../../core/widget/cusrom_rating_summary.dart';
import '../../../review/presentation/view_models/bloc/review_bloc.dart';

class VisitWorkerProfileBody extends StatefulWidget {
  final WorkerProfile visitedProfile;

  const VisitWorkerProfileBody({super.key, required this.visitedProfile});

  @override
  State<VisitWorkerProfileBody> createState() => _VisitWorkerProfileBodyState();
}

class _VisitWorkerProfileBodyState extends State<VisitWorkerProfileBody> {
  late WorkerProfile currentProfile;
  @override
  void initState() {
    super.initState();
    currentProfile = widget.visitedProfile;
    context
        .read<PortofolioBloc>()
        .add(GetPortofolios(workerProfileId: currentProfile.id!));
    context.read<ReviewBloc>().add(GetReview(currentProfile.id!, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push('/report', extra: currentProfile.userId);
                },
                icon: const Icon(Icons.report)),
          ],
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
              child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 1),
                  child: VisitWorkerCustomProfileCard(
                    profile: currentProfile,
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
                  const Row(
                    children: [
                      CustomSubTitle(
                        text: "ملف الأعمال السابقة",
                      ),
                      Spacer(),
                    ],
                  ),
                  const VirticalSpace(1.5),
                  VisitPortofolioWidget(
                    workerProfileId: currentProfile.id!,
                  ),
                  // const VirticalSpace(4),
                  // const CustomSubTitle(
                  //   text: "المشاريع المكتملة",
                  // ),
                  // const VirticalSpace(0.5),
                  // SizedBox(
                  //   height: SizeConfig.defaultSize! * 40,
                  //   child: ListView.separated(
                  //     separatorBuilder: (context, index) {
                  //       return const HorizintalSpace(0.3);
                  //     },
                  //     itemCount: 3,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return CustomProjectCard(project: ProjectModel());
                  //     },
                  //   ),
                  // ),
                  // const VirticalSpace(5),
                  // const CustomZzz(),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "التقيمات",
                  ),
                  const CusromRatingSummary(),
                ],
              ))
        ],
      ),
    );
  }
}
