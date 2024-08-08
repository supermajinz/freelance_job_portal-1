import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/view_models/project_bloc/project_bloc.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/custom_offer.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_chip_project.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_container.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony.dart';
import '../../../../../core/widget/custom_sub_title.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../../data/model/project_model/project_model.dart';
import '../../view_models/offer_by_project/offer_by_project_bloc.dart';

class ShowProjectDetailsBody extends StatefulWidget {
  final ProjectModel project;

  const ShowProjectDetailsBody({super.key, required this.project});

  @override
  // ignore: library_private_types_in_public_api
  _ShowProjectDetailsBodyState createState() => _ShowProjectDetailsBodyState();
}

class _ShowProjectDetailsBodyState extends State<ShowProjectDetailsBody> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        showOffers
            ? _scrollController.position.maxScrollExtent
            : _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    });
  }

  void _deleteProject() {
    context.read<ProjectBloc>().add(DeleteProject(widget.project.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is ProjectDelet) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم حذف المشروع بنجاح')),
          );
          GoRouter.of(context).pop();
        }
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const VirticalSpace(4),
            Stack(
              children: [
                _buildProjectDetailsContainer(context, widget.project),
                _buildClientInfoContainer(context, widget.project),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetailsContainer(
    
      BuildContext context, ProjectModel project) {
         final clientId = (context.read<AuthBloc>().state
                                as AuthAuthenticated)
                            .id;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .5),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
          topRight: Radius.circular(SizeConfig.defaultSize! * 4),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VirticalSpace(15),
            _buildProjectHeader(context, project),
            const VirticalSpace(2),
            _buildProjectDescription(context, project),
            const VirticalSpace(4),
            _buildprojectTime(project),
            const VirticalSpace(3),
            _buildProjectPrice(project),
            const VirticalSpace(3),
            _buildProjectSkills(project),
            const VirticalSpace(5),
            _buildOffersToggle(project),
            const VirticalSpace(2),
            _buildOffersList(),
            const VirticalSpace(2),
            if(project.client!.userId!=clientId)
            _buildApplyButton(context, project),
            const VirticalSpace(2),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectHeader(BuildContext context, ProjectModel project) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.laptop),
        CustomSubTitle(text: project.name),
        Column(
          children: [
            const CustomLabel(text: "1d", color: Colors.black),
            CustomLabel(text: project.status, color: Colors.black),
          ],
        )
      ],
    );
  }

  Widget _buildProjectDescription(BuildContext context, ProjectModel project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSubTitleMedium(text: "Description:"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * .5),
          child: Text(
            project.description,
            textAlign: TextAlign.start,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const VirticalSpace(.5),
        InkWell(
          onTap: () {},
          child: Text(
            "show more",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decorationThickness: 2,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildprojectTime(ProjectModel project) {
    return Row(
      children: [
        const Expanded(child: CustomSubTitleMedium(text: "Delivery Time:")),
        Expanded(
          child: CustomContainer(
            text: project.expectedDuration.toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectPrice(ProjectModel project) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomSubTitleMedium(text: "Price:"),
        CustomMeony(
          text:
              "${project.minBudget.toString()}  _  ${project.maxBudget.toString()}",
        ),
      ],
    );
  }

  Widget _buildProjectSkills(ProjectModel project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSubTitleMedium(text: "Skills Required:"),
        const VirticalSpace(1),
        Wrap(
          spacing: SizeConfig.defaultSize! * 1,
          runSpacing: SizeConfig.defaultSize! * .5,
          children: [
            for (var skill in project.projectSkill)
              CustomChipProject(text: skill.name),
          ],
        ),
      ],
    );
  }

  Widget _buildOffersToggle(ProjectModel project) {
    return InkWell(
      onTap: _toggleOffers,
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.defaultSize! * 3,
        width: SizeConfig.defaultSize! * 10,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 2),
        ),
        child: CustomBody(text: "Offers: ${project.offerCount}"),
      ),
    );
  }

  Widget _buildOffersList() {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 800),
      firstChild: Container(),
      secondChild: BlocBuilder<OfferByProjectBloc, OfferByProjectState>(
        builder: (context, state) {
          if (state is OfferByProjectLoaded) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .push("/offerdetails", extra: state.offers[index]);
                    },
                    child: CustomOffer(offer: state.offers[index]));
              },
              separatorBuilder: (context, index) {
                return const VirticalSpace(1);
              },
              itemCount: state.offers.length,
            );
          } else if (state is OfferByProjectFaliure) {
            return Center(child: Text("'Error: ${state.message}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      crossFadeState:
          showOffers ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }


  Widget _buildApplyButton(BuildContext context, ProjectModel project) {
    return Center(
      child: CustomButtonGeneral(
        onPressed: () {
          GoRouter.of(context).push("/createoffer", extra: project);
        },
        color: Colors.white,
        textcolor: Colors.black,
        text: "Apply",
        borderSide:
            BorderSide(width: SizeConfig.defaultSize! * .1, color: Colors.grey),
        width: SizeConfig.defaultSize! * 20,
      ),
    );
  }

  Widget _buildClientInfoContainer(BuildContext context, ProjectModel project) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .5),
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
            topRight: Radius.circular(SizeConfig.defaultSize! * 4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
              child: CircleAvatar(
                radius: SizeConfig.defaultSize! * 5,
                backgroundImage: const AssetImage("assets/images/pro.jpg"),
              ),
            ),
            const HorizintalSpace(.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSubTitleMedium(
                  text:
                      "${project.client?.userDto?.firstname ?? 'Unknown'} ${project.client?.userDto?.lastname ?? ''}",
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                  child: CustomBody(
                    text: project.client?.jobTitleDto?.title ?? 'No job title',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.defaultSize! * .8),
                  child: const CustomBody(
                    text: "13 مشروع مكتمل",
                    color: Colors.white,
                  ),
                ),
                const VirticalSpace(0.2),
                Row(
                  children: [
                    CustomLabel(
                      text: project.client?.rate.toString() ?? 'N/A',
                      color: Colors.white,
                    ),
                    const HorizintalSpace(0.5),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            PopupMenuButton(
              position: PopupMenuPosition.under,
              constraints: const BoxConstraints(maxHeight: 150),
              elevation: 10,
              iconColor: Colors.white,
              iconSize: 25,
              onSelected: (value) {
                if (value == 'edit') {
                  GoRouter.of(context).push("/editproject", extra: project);
                } else if (value == 'delete') {
                  _deleteProject();
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.edit),
                        CustomBody(
                          text: "تعديل المشروع",
                        ),
                      ],
                    )),
                const PopupMenuItem(
                    value: "delete",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        CustomBody(
                          text: "حذف المشروع",
                          color: Colors.red,
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }

  Widget buildClientImage(dynamic project) {
    return Container(
      width: SizeConfig.defaultSize! * 5,
      height: SizeConfig.defaultSize! * 5,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildClientInfo(dynamic project) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSubTitle(text: project.clientName ?? 'Client Name'),
            CustomBody(text: "Country: ${project.clientCountry ?? 'Unknown'}"),
            CustomBody(
                text: "Registered: ${project.clientRegistered ?? 'N/A'}"),
          ],
        ),
      ),
    );
  }

  Widget buildClientRating(dynamic project) {
    return Container(
      width: SizeConfig.defaultSize! * 7,
      decoration: BoxDecoration(
        border: Border.all(
          width: SizeConfig.defaultSize! * .2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child:
                  CustomBody(text: "Rating: ${project.clientRating ?? 'N/A'}"),
            ),
          ),
        ],
      ),
    );
  }
}
