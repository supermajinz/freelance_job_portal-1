import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';
import '../../../../../core/widget/space.dart';
import '../../../../projects/presentation/view_models/project_bloc/project_bloc.dart';

class CustomInfoDetailsStatus extends StatefulWidget {
  const CustomInfoDetailsStatus({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  State<CustomInfoDetailsStatus> createState() =>
      _CustomInfoDetailsStatusState();
}

class _CustomInfoDetailsStatusState extends State<CustomInfoDetailsStatus> {
  void _deleteProject() {
    context.read<ProjectBloc>().add(DeleteProject(widget.projectModel.id));
  }

  void _closeProject() {
    context.read<ProjectBloc>().add(CloseProject(widget.projectModel.id));
  }

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 5,
                  backgroundImage: const AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
              ),
              const HorizintalSpace(.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSubTitleMedium(
                    text: widget.projectModel.client!.userDto!.firstname!,
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: CustomBody(
                      text: widget.projectModel.client!.jobTitleDto!.title!,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: const CustomBody(
                      text: "13 مشروع مكتمل",
                      color: Colors.white,
                    ),
                  ),
                  const VirticalSpace(0.2),
                  Row(
                    children: [
                      CustomLabel(
                        text: widget.projectModel.client!.rate.toString(),
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
                    GoRouter.of(context)
                        .push("/editproject", extra: widget.projectModel);
                  } else if (value == 'delete') {
                    _deleteProject();
                  } else if (value == 'close') {
                    _closeProject();
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
                      value: 'close',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.close_fullscreen_rounded),
                          CustomBody(
                            text: "اغلاق المشروع",
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
          )
        ],
      ),
    );
  }
}
