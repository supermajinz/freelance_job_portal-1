// Edit Worker Profile Body
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/photo_dt_o.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_edit_proto.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/create_profile_body.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_image_gallery_widget.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_photo_profile_1.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/create_project_body.dart';
import 'package:go_router/go_router.dart';

class EditWorkerProfileBody extends StatefulWidget {
  final WorkerProfile profile;
  const EditWorkerProfileBody({super.key, required this.profile});

  @override
  State<EditWorkerProfileBody> createState() => _EditWorkerProfileBodyState();
}

class _EditWorkerProfileBodyState extends State<EditWorkerProfileBody> {
  late final TextEditingController descriptionController;
  Categories? category;
  late final List<Skills> skills;
  late JobTitle _selectedJobTitle;
  PhotoDtO? selectedPhoto; //old photo if new one is selected
  late List<String> selectedPhotos;
  List<int> deletedPhotos = [];
  List<int> addedPhotos = [];
  int? newPhotoId;
  List<int> deletedSkills = [];
  List<int> addedSkills = [];
  @override
  void dispose() {
    descriptionController.clear();
    addedSkills.clear();
    addedPhotos.clear();
    deletedPhotos.clear();
    deletedSkills.clear();
    newPhotoId = null;
    selectedPhoto = null;
    selectedPhotos.clear();
    skills.clear();

    super.dispose();
  }

  @override
  void initState() {
    descriptionController = TextEditingController(text: widget.profile.bio);
    skills = widget.profile.skillDtOs!.map((skillDto) {
      return Skills(
        id: skillDto.id!,
        name: skillDto.name!,
      );
    }).toList();

    selectedPhotos = widget.profile.photoDtOs!
        .map((e) => '${DependencyInjection.baseUrl}file/photo/${e.photo!}')
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    category = Categories(
        id: widget.profile.categoryDto!.id!,
        name: widget.profile.categoryDto!.name!);
    _selectedJobTitle = JobTitle(
      id: widget.profile.jobTitleDto!.id,
      title: widget.profile.jobTitleDto!.title,
    );
    if (widget.profile.photoDtOs?.isNotEmpty == true &&
        widget.profile.photoDtOs?[0] != null) {
      selectedPhoto = widget.profile.photoDtOs![0];
    }
    return BlocListener<WorkerProfileBloc, WorkerProfileState>(
      listener: (context, state) {
        if (state is WorkerProfileEditedState) {
          _handleProfileEdit(context, state);
        } else if (state is WorkerProfileEditError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        } else if (state is WorkerProfileDeletePhotoError ||
            state is WorkerProfileDeleteSkillError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: error deleting')),
          );
        } else if (state is WorkerProfileDeletedPhoto ||
            state is WorkerProfileDeletedSkill) {
          setState(() {});
          // Refresh the profile data or update the UI accordingly
        }
      },
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 1.5,
                vertical: SizeConfig.defaultSize! * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    BlocProvider(
                      create: (context) =>
                          ImageBloc(DependencyInjection.providePhotoRepo()),
                      child: EditPhotoProfile(
                        onPhotoUploaded: (int e) {
                          newPhotoId = e;
                          print('upadted photo: new id $newPhotoId');
                        },
                        selectedPhoto: selectedPhoto,
                      ),
                    ),
                  ],
                ),
                const VirticalSpace(5),
                const VirticalSpace(2),
                EditTextForm(
                    mycontroller: descriptionController,
                    hinttext: "",
                    lable: "الوصف",
                    isNumber: false),
                const VirticalSpace(4),
                const CustomSubTitle(
                  text: "الصور",
                ),
                const VirticalSpace(2),
                BlocProvider(
                  create: (context) =>
                      ImageBloc(DependencyInjection.providePhotoRepo()),
                  child: EditImageGalleryWidget(
                    onPhotoUploaded: (int e) {
                      addedPhotos.add(e);
                    },
                    onPhotoDeleted: (int e) {
                      deletedPhotos.add(e);
                    },
                    selectedPhotos: widget.profile.photoDtOs,
                  ),
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "المسمى الوظيفي",
                ),
                const VirticalSpace(2),
                DropDownSearchJobTitles(
                  onChanged: (value) {
                    _selectedJobTitle = value!;
                  },
                  selectedJobTitle: _selectedJobTitle,
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "الصنف",
                ),
                const VirticalSpace(2),
                CustomDropdownSearchCategories(
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        category = value;
                        skills.clear();
                      });
                    }
                  },
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "المهارات",
                ),
                const VirticalSpace(2),
                CustomDropdownSearchSkills(
                  category: category,
                  onChanged: (value) {
                    if (value != null && !skills.contains(value)) {
                      setState(() {
                        skills.add(value);
                      });
                      addedSkills.add(value.id);
                    }
                  },
                ),
                const VirticalSpace(2),
                CustomShowChipButton(
                  projectItems: skills.map((skill) => skill.name).toList(),
                  onDelete: (name) {
                    setState(() {
                      // Find the skill to be deleted
                      Skills skillToDelete =
                          skills.firstWhere((element) => element.name == name);

                      // Remove the skill from the skills list
                      skills.removeWhere((element) => element.name == name);

                      // Add the id of the deleted skill to deletedSkills list
                      deletedSkills.add(skillToDelete.id);
                    });
                  },
                ),
                const VirticalSpace(2),
                const VirticalSpace(5),
                AddEditProto(
                  text: "Edit Protofolio Project",
                  onTap: () {
                    GoRouter.of(context).push("/editprotofolio");
                  },
                ),
                const VirticalSpace(6),
                Center(
                    child: CustomButtonGeneral(
                        onPressed: () {
                          print("""data:
                            profile id: ${widget.profile.id!}
                             NewselectedProfilePic:$newPhotoId
                             ProfilePic to be deleted: ${selectedPhoto?.photo ?? ''}
                             newBio: ${descriptionController.text}
                             newJobTitle: ${_selectedJobTitle.title}
                             AddedPhotos: ${addedPhotos.toString()}
                             deletedPhotos: ${deletedPhotos.toString()}
                             newCategory: $category
                             newSkills: $addedSkills
                             deletedSkills:$deletedSkills
                              """);
                          context.read<WorkerProfileBloc>().add(
                              EditWorkerProfileEvent(widget.profile.id!,
                                  description: descriptionController.text,
                                  jobTitleId: _selectedJobTitle.id!,
                                  categoryId: category?.id ?? 1));
                        },
                        color: Theme.of(context).primaryColor,
                        textcolor: Colors.white,
                        text: "Save",
                        borderSide: const BorderSide(width: 0),
                        width: SizeConfig.defaultSize! * 20)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleProfileEdit(BuildContext context, WorkerProfileEditedState) {
    if (newPhotoId != null) {
      // Delete old
      if (selectedPhoto != null) {
        context.read<WorkerProfileBloc>().add(DeletePhotoToWorkerProfileEvent(
            widget.profile.id!, selectedPhoto!.id!));
        print(
            'widget deleted old profile pic with ${selectedPhoto.toString()}');
      }
      // Add new
      if (newPhotoId != null) {
        context
            .read<WorkerProfileBloc>()
            .add(AddPhotoToWorkerProfileEvent(widget.profile.id!, newPhotoId!));
        print('widget new photo $newPhotoId');
      }
    }
    if (deletedSkills.isNotEmpty) {
      for (int skillId in deletedSkills) {
        context
            .read<WorkerProfileBloc>()
            .add(DeleteSkillToWorkerProfileEvent(widget.profile.id!, skillId));
      }
      deletedSkills.clear();
    }
    if (deletedPhotos.isNotEmpty) {
      for (int photoId in deletedPhotos) {
        context
            .read<WorkerProfileBloc>()
            .add(DeletePhotoToWorkerProfileEvent(widget.profile.id!, photoId));
      }
      deletedPhotos.clear();
    }
    if (addedSkills.isNotEmpty) {
      for (int skillId in addedSkills) {
        context
            .read<WorkerProfileBloc>()
            .add(AddSkillToWorkerProfileEvent(widget.profile.id!, skillId));
      }
      addedSkills.clear();
    }
    if (addedPhotos.isNotEmpty) {
      for (int photoId in addedPhotos) {
        context
            .read<WorkerProfileBloc>()
            .add(AddPhotoToWorkerProfileEvent(widget.profile.id!, photoId));
      }
      addedPhotos.clear();
    }
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile edited successfully!')),
    );

    // Navigate to the next screen or perform any other action
    //  context.read<NavigationBloc>().add(const PageTapped(
    //      0,
    //  ));
    GoRouter.of(context).pushReplacement('/homescreen');
  }
}

class CustomShowChipButton extends StatelessWidget {
  final List<String> projectItems;
  final Function(String) onDelete;

  const CustomShowChipButton(
      {super.key, required this.projectItems, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SizeConfig.defaultSize! * 1,
      direction: Axis.horizontal,
      runSpacing: SizeConfig.defaultSize! * .5,
      children: projectItems
          .map((item) =>
              CustomChipButton(onDeleted: () => onDelete(item), text: item))
          .toList(),
    );
  }
}
