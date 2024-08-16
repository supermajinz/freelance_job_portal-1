import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/functions/show_bottom_sheet_offer.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_container.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_meony.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../core/utils/functions/utils.dart';
import '../../../../projects/presentation/view_models/offer_by_project/offer_by_project_bloc.dart';
import '../../../../projects/presentation/view_models/project_bloc/project_bloc.dart';
import '../../../../projects/presentation/views/widget/custom_chip_project.dart';
import '../../../data/model/offers_model/offers_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class OfferDetailsBody extends StatelessWidget {
  const OfferDetailsBody(
      {super.key, required this.offer, required this.project});
  final OffersModel offer;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    final createDate = offer.createDate?.toLocal() ?? DateTime.now();
    final formattedCreateDate = timeago.format(createDate, locale: 'ar');
    final workerName =
        '${offer.worker!.userDto!.firstname ?? 'Unknown'} ${offer.worker!.userDto!.lastname ?? ''}';
    final workerPhotoUrl = offer.worker!.photoDtOs?.isNotEmpty == true
        ? "${DependencyInjection.baseUrl}file/photo/${offer.worker!.photoDtOs![0].photo}"
        : null;
    final backgroundColor =
        workerPhotoUrl == null ? Utils.getBackgroundColor(workerName) : null;
    return Scaffold(
      body: BlocListener<OfferBloc, OfferState>(
        listener: (context, state) {
          if (state is OfferDeleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم حذف العرض بنجاح')),
            );
            project.offerCount--;
            GoRouter.of(context).pop();
            context
                .read<OfferByProjectBloc>()
                .add(FetchOffersByProject(project.id));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VirticalSpace(6),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * .5),
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                        topRight:
                            Radius.circular(SizeConfig.defaultSize! * 4))),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: BlocProvider(
                              create: (context) => WorkerProfileBloc(
                                  DependencyInjection
                                      .provideWorkerProfileRepo(),
                                  DependencyInjection
                                      .provideSharedPreferences())
                                ..add(GetWorkerProfiles(
                                    offer.worker!.userDto!.id!)),
                              child: BlocBuilder<WorkerProfileBloc,
                                  WorkerProfileState>(
                                builder: (context, state) {
                                  if (state is WorkerProfileLoading) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (state is! WorkerProfilesLoaded) {
                                    return const Placeholder();
                                  }
                                  final WorkerProfile visitedProfile =
                                      state.profiles.firstWhere((profile) =>
                                          profile.id == offer.worker!.id);
                                  return InkWell(
                                    onTap: () {
                                      GoRouter.of(context).push(
                                          '/visitworkerprofile',
                                          extra: visitedProfile);
                                    },
                                    child: CircleAvatar(
                                        radius: SizeConfig.defaultSize! * 5,
                                        backgroundColor: backgroundColor,
                                        backgroundImage: workerPhotoUrl != null
                                            ? NetworkImage(workerPhotoUrl)
                                            : null,
                                        child: workerPhotoUrl == null
                                            ? Center(
                                                child: Text(
                                                  Utils.getInitials(workerName),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30),
                                                ),
                                              )
                                            : null),
                                  );
                                },
                              ),
                            )),
                        const HorizintalSpace(1.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSubTitleMedium(
                              text:
                                  "${offer.worker?.userDto?.firstname ?? 'Unknown'} ${offer.worker?.userDto?.lastname ?? ''}",
                              color: Colors.white,
                            ),
                            CustomBody(
                              text: offer.worker!.jobTitleDto!.title!,
                              color: Colors.white,
                            ),
                            const CustomBody(
                              text: "13 مشروع مكتمل",
                              color: Colors.white,
                            ),
                            const VirticalSpace(0.2),
                            Row(
                              children: [
                                CustomLabel(
                                  text: offer.worker!.rate.toString(),
                                  color: Colors.white,
                                ),
                                const HorizintalSpace(0.5),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        if (offer.worker?.userId == userId)
                          PopupMenuButton(
                            position: PopupMenuPosition.under,
                            constraints: const BoxConstraints(maxHeight: 150),
                            elevation: 10,
                            iconColor: Colors.white,
                            iconSize: 25,
                            onSelected: (value) {
                              if (value == 'edit') {
                                GoRouter.of(context)
                                    .push("/editoffer", extra: offer);
                              } else if (value == 'delete') {
                                context
                                    .read<OfferBloc>()
                                    .add(DeleteOffer(offer.id!));
                              }
                            },
                            itemBuilder: (context) => [
                              if (project.status == "open")
                                const PopupMenuItem(
                                    value: 'edit',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(IconlyBroken.edit),
                                        CustomBody(
                                          text: "تعديل العرض",
                                        ),
                                      ],
                                    )),
                              const PopupMenuItem(
                                  value: "delete",
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        IconlyBroken.delete,
                                        color: Colors.red,
                                      ),
                                      CustomBody(
                                        text: "حذف العرض",
                                        color: Colors.red,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                      ],
                    ),
                    const VirticalSpace(2),
                    Container(
                      alignment: Alignment.topRight,
                      child: Wrap(
                        spacing: SizeConfig.defaultSize! * 1,
                        runSpacing: SizeConfig.defaultSize! * .5,
                        children: [
                          for (var skill in offer.worker!.skillDtOs ?? [])
                            CustomChipProject(
                                text: skill.name ?? 'Unknown Skill'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 600),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize! * .5),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [CustomLabel(text: formattedCreateDate)],
                      ),
                      const CustomSubTitleMedium(text: 'وصف العرض'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.defaultSize! * 1),
                        child: Text(
                          offer.message!,
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const VirticalSpace(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomSubTitleMedium(text: "المبلغ المقدم"),
                          CustomMeony(
                            text: offer.cost?.toString() ?? 'N/A',
                          )
                        ],
                      ),
                      const VirticalSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              child:
                                  CustomSubTitleMedium(text: "المدة المتوقعة")),
                          Expanded(
                            child: CustomContainer(
                              text: offer.deliveryTime?.toString() ?? 'N/A',
                            ),
                          )
                        ],
                      ),
                      const VirticalSpace(17),
                      if (project.client?.userId == userId)
                        _buildProjectOwnerButtons(context),
                      if (offer.worker?.userId == userId)
                        _buildOfferOwnerButton(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProjectOwnerButtons(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is OfferAccept) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم قبول العرض بنجاح')),
          );
          GoRouter.of(context).pushReplacement("/myproject");
        } else if (state is OfferReject) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم رفض العرض بنجاح')),
          );
        }
      },
      child: project.status == 'open'
          ? Row(
              children: [
                Expanded(
                  flex: 7,
                  child: CustomButtonGeneral(
                      icon: const Icon(LineAwesomeIcons.check_circle,
                          color: Color.fromARGB(255, 6, 124, 67)),
                      onPressed: () {
                        showBottomSheetOffer(context, () {
                          context
                              .read<ProjectBloc>()
                              .add(AcceptOffer(offer.id!));
                        }, offer.cost!, offer.deliveryTime!, project.name);
                      },
                      color: Colors.white,
                      textcolor: const Color.fromARGB(255, 6, 124, 67),
                      text: "قبول العرض",
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 6, 124, 67),
                      ),
                      width: SizeConfig.defaultSize! * 20),
                ),
                const Spacer(),
                Expanded(
                  flex: 7,
                  child: CustomButtonGeneral(
                      icon: const Icon(LineAwesomeIcons.times_circle_1,
                          color: Color.fromARGB(255, 179, 56, 56)),
                      onPressed: () {
                        context.read<ProjectBloc>().add(RejectOffer(offer.id!));
                      },
                      color: Colors.white,
                      textcolor: const Color.fromARGB(255, 179, 56, 56),
                      text: "رفض العرض",
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 179, 56, 56),
                      ),
                      width: SizeConfig.defaultSize! * 20),
                )
              ],
            )
          : const Center(
              // child: CustomButtonGeneral(
              //     icon: const Icon(IconlyBroken.chat, color: Colors.white),
              //     onPressed: () {},
              //     color: Theme.of(context).primaryColor,
              //     textcolor: Colors.white,
              //     text: "محادثة",
              //     borderSide: const BorderSide(width: 0),
              //     width: SizeConfig.defaultSize! * 20),
              ),
    );
  }

  _buildOfferOwnerButton(BuildContext context) {
    return const SizedBox();
  }
}
