import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_body_status_details.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_info_details_status.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_timeline.dart';
import 'package:freelance_job_portal/features/offers/presentation/view_models/args/offer_details_args.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../../../offers/presentation/views/widget/custom_offer.dart';
import '../../../../projects/presentation/view_models/offer_by_project/offer_by_project_bloc.dart';
import '../../../../projects/presentation/view_models/project_bloc/project_bloc.dart';
import '../../../../review/presentation/view_models/args/review_args.dart';

class ProjectStatusDetailsBody extends StatefulWidget {
  const ProjectStatusDetailsBody({super.key, required this.project});
  final ProjectModel project;

  @override
  // ignore: library_private_types_in_public_api
  _ShowProjectDetailsBodyState createState() => _ShowProjectDetailsBodyState();
}

class _ShowProjectDetailsBodyState extends State<ProjectStatusDetailsBody>
    with SingleTickerProviderStateMixin {
  bool showOffers = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleOffers() {
    setState(() {
      showOffers = !showOffers;
    });
    if (showOffers) {
      context
          .read<OfferByProjectBloc>()
          .add(FetchOffersByProject(widget.project.id));
      if (widget.project.offerCount == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يوجد عروض على المشاريع')),
        );
      }
    }
    if (showOffers) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    print("will $userId");
    print("will ${widget.project.status == "inProgress"}");
    print("will ${widget.project.status}");
    print("will ${widget.project.worker?.userId}");
    print(
        "will ${widget.project.worker?.userId == userId}____${widget.project.status == "inProgress"}");
    return Scaffold(
      body: BlocListener<ProjectBloc, ProjectState>(
        listener: (context, state) {
          if (state is ProjectDelet) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم حذف المشروع بنجاح')),
            );
            GoRouter.of(context).pop();
          } else if (state is ProjectClose) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم اغلاق المشروع بنجاح')),
            );
          }
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const VirticalSpace(3),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * .5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                        topRight: Radius.circular(SizeConfig.defaultSize! * 4),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VirticalSpace(15),
                        CustomBodyStatusDetails(
                          projectModel: widget.project,
                        ),
                        CustomTimeline(
                          currentStatus: ProjectModel.projectStatuses
                              .indexOf(widget.project.status),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.defaultSize! * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VirticalSpace(5),
                              InkWell(
                                onTap: _toggleOffers,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.defaultSize! * 3,
                                  width: SizeConfig.defaultSize! * 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.defaultSize! * 2)),
                                  child: CustomBody(
                                    text:
                                        "Offers: ${widget.project.offerCount}",
                                  ),
                                ),
                              ),
                              const VirticalSpace(2),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                height: showOffers ? null : 0,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 500),
                                  opacity: showOffers ? 1.0 : 0.0,
                                  child: showOffers
                                      ? BlocBuilder<OfferByProjectBloc,
                                          OfferByProjectState>(
                                          builder: (context, state) {
                                            if (state is OfferByProjectLoaded) {
                                              return ListView.separated(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                      onTap: () {
                                                        GoRouter.of(context).push(
                                                            "/offerdetails",
                                                            extra: OfferDetailsArgs(
                                                                offersModel:
                                                                    state.offers[
                                                                        index],
                                                                projectModel:
                                                                    widget
                                                                        .project));
                                                      },
                                                      child: CustomOffer(
                                                          offer: state
                                                              .offers[index]));
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const VirticalSpace(1);
                                                },
                                                itemCount: state.offers.length,
                                              );
                                            } else if (state
                                                is OfferByProjectFaliure) {
                                              return Center(
                                                  child: Text(
                                                      "'Error: ${state.message}"));
                                            } else {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                              const VirticalSpace(2),
                              if (widget.project.client!.userId == userId &&
                                  widget.project.status == "submitted")
                                _buildCompleteButton(
                                    context,
                                    widget
                                        .project), //for owner client when submitted
                              if (widget.project.worker?.userId == userId &&
                                  widget.project.status == "inProgress")
                                _buildSubmitButton(
                                    context,
                                    widget
                                        .project), //for project worker when in progress
                              if (widget.project.worker?.userId == userId &&
                                  widget.project.status == "submitted")
                                _buildSubmittedMsg(
                                    context,
                                    widget
                                        .project), //for project worker when in submitted
                              const VirticalSpace(2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomInfoDetailsStatus(
                    projectModel: widget.project,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCompleteButton(BuildContext context, ProjectModel project) {
    final clientId = project.client!.id!;
    final projectId = project.id;
    final workerId = project.worker!.id!;
    final reviewedName = project.worker!.userDto!.firstname!;
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is ProjectComplete) {
          GoRouter.of(context).pushNamed("/review",
              extra: ReviewArgs(
                  rated: "Worker",
                  projectId: projectId,
                  clientId: clientId,
                  workerId: workerId,
                  reviewedName: reviewedName));
        }
      },
      child: Center(
        child: CustomButtonGeneral(
          onPressed: () {
            context.read<ProjectBloc>().add(CompleteProject(widget.project.id));
          },
          color: Colors.white,
          textcolor: Colors.black,
          text: "Complete",
          borderSide: BorderSide(
              width: SizeConfig.defaultSize! * .1, color: Colors.grey),
          width: SizeConfig.defaultSize! * 20,
        ),
      ),
    );
  }

  _buildSubmitButton(BuildContext context, ProjectModel project) {
    print("will submit");
    return Center(
      child: CustomButtonGeneral(
        onPressed: () {
          context.read<ProjectBloc>().add(SubmitProject(widget.project.id));
        },
        color: Colors.white,
        textcolor: Colors.black,
        text: "Submit",
        borderSide:
            BorderSide(width: SizeConfig.defaultSize! * .1, color: Colors.grey),
        width: SizeConfig.defaultSize! * 20,
      ),
    );
  }

  _buildSubmittedMsg(BuildContext context, ProjectModel project) {
    return const CustomSubTitleMedium(text: '');
  }
}
