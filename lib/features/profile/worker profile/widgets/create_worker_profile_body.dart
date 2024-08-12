// Create Worker Profile Body
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/bloc/categories_skills_bloc.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/categories/category.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_edit_proto.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_photo_profile1.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/create_profile_body.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_show_chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/image_gallery_widget.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/bloc/worker_profile_bloc.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/create_project_body.dart';
import 'package:go_router/go_router.dart';

class CreateWorkerProfileBody extends StatefulWidget {
  const CreateWorkerProfileBody({super.key});

  @override
  State<CreateWorkerProfileBody> createState() =>
      _CreateWorkerProfileBodyState();
}

class _CreateWorkerProfileBodyState extends State<CreateWorkerProfileBody> {
  final _descriptionController = TextEditingController();
  List<Skills> _selectedSkills = [];
  int? _selectedProfilePhotoId;
  List<int> _selectedGalleryPhotoIds = [];
  int? _selectedJobTitleId;
  Categories? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkerProfileBloc, WorkerProfileState>(
      listener: (context, state) {
        if (state is WorkerProfileCreatedState) {
          _handleProfileCreated(context, state);
        } else if (state is WorkerProfileCreateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
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
                BlocProvider(
                  create: (context) =>
                      ImageBloc(DependencyInjection.providePhotoRepo()),
                  child: AddPhotoProfile(
                    onPhotoUploaded: (int photoId) {
                      setState(() {
                        _selectedProfilePhotoId = photoId;
                      });
                      print(
                          'Uploaded Profile Photo ID: $_selectedProfilePhotoId');
                    },
                  ),
                ),
                const VirticalSpace(7),
                CustomTextFormGeneral(
                  mycontroller: _descriptionController,
                  hinttext: "",
                  lable: "الوصف",
                  isNumber: false,
                ),
                const VirticalSpace(5),
                const VirticalSpace(1.5),
                const VirticalSpace(5),
                BlocProvider(
                  create: (context) =>
                      ImageBloc(DependencyInjection.providePhotoRepo()),
                  child: ImageGalleryWidget(
                    onPhotoUploaded: (int photoId) {
                      setState(() {
                        _selectedGalleryPhotoIds.add(photoId);
                      });
                      print('Uploaded Gallery Photo ID: $photoId');
                      print('All Gallery Photo IDs: $_selectedGalleryPhotoIds');
                    },
                  ),
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "المسمى الوظيفي",
                ),
                const VirticalSpace(1.5),
                DropDownSearchJobTitles(onChanged: (value) {
                  setState(() {
                    _selectedJobTitleId = value!.id;
                  });
                }),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "التصنيف",
                ),
                const VirticalSpace(1.5),
                CustomDropdownSearchCategories(onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategory = value;
                      _selectedSkills.clear();
                    });
                  }
                }),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "المهارات",
                ),
                CustomDropdownSearchSkills(
                  category: _selectedCategory,
                  onChanged: (value) {
                    if (value != null && !_selectedSkills.contains(value)) {
                      setState(() {
                        _selectedSkills.add(value);
                      });
                    }
                  },
                ),
                const VirticalSpace(2),
                CustomShowChipButton(
                  projectItems:
                      _selectedSkills.map((skill) => skill.name).toList(),
                  onDelete: (name) {
                    setState(() {
                      _selectedSkills
                          .removeWhere((element) => element.name == name);
                    });
                  },
                ),
                const VirticalSpace(4),
                AddEditProto(
                  text: "Add Protofolio Project",
                  onTap: () {
                    context.read<NavigationBloc>().add(const PageTapped(
                          4,
                        ));
                    GoRouter.of(context).push('/homescreen');
                  },
                ),
                const VirticalSpace(6),
                Center(
                  child: CustomButtonGeneral(
                    onPressed: () {
                      if (_descriptionController.text.isEmpty ||
                          _selectedJobTitleId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Please fill in all required fields')),
                        );
                        return;
                      }

                      context
                          .read<WorkerProfileBloc>()
                          .add(CreateWorkerProfileEvent(
                            description: _descriptionController.text,
                            jobTitleId: _selectedJobTitleId!,
                            categoryId: _selectedCategory!.id!,
                          ));
                    },
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "Create",
                    borderSide: const BorderSide(width: 0),
                    width: SizeConfig.defaultSize! * 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleProfileCreated(
      BuildContext context, WorkerProfileCreatedState state) {
    // Add profile photo to profile
    if (_selectedProfilePhotoId != null) {
      context.read<WorkerProfileBloc>().add(AddPhotoToWorkerProfileEvent(
            state.workerProfile.id!,
            _selectedProfilePhotoId!,
          ));
    }

    // Add gallery photos to profile
    for (int photoId in _selectedGalleryPhotoIds) {
      context.read<WorkerProfileBloc>().add(AddPhotoToWorkerProfileEvent(
            state.workerProfile.id!,
            photoId,
          ));
    }

    // Add skills to profile
    if (_selectedSkills.isNotEmpty) {
      for (var item in _selectedSkills) {
        context.read<WorkerProfileBloc>().add(AddSkillToWorkerProfileEvent(
              state.workerProfile.id!,
              item.id,
            ));
      }
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile created successfully!')),
    );

    // Navigate to the next screen or perform any other action
    context.read<NavigationBloc>().add(const PageTapped(
          0,
        ));
    GoRouter.of(context).push('/homescreen');
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
