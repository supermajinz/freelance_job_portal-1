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
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/view_models/bloc/profile_bloc.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_edit_proto.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_show_chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';

import 'add_photo_profile1.dart';

class CreateProfileBody extends StatefulWidget {
  const CreateProfileBody({super.key});

  @override
  State<CreateProfileBody> createState() => _CreateProfileBodyState();
}

class _CreateProfileBodyState extends State<CreateProfileBody> {
  final _descriptionController = TextEditingController();
  List<int>? _selectedSkillId = [1, 2];
  int? _selectedPhotoId;
  int? _selectedJobTitleId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ClientProfileCreatedState) {
          _handleProfileCreated(context, state);
        } else if (state is ProfileCreateError) {
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
                    onPhotoUploaded: (int e) {
                      setState(() {
                        _selectedPhotoId = e;
                      });
                      print('Uploaded Photo ID: $_selectedPhotoId');
                    },
                  ),
                ),
                const VirticalSpace(5),
                const VirticalSpace(2),
                CustomTextFormGeneral(
                  mycontroller: _descriptionController,
                  hinttext: "",
                  lable: "الوصف",
                  isNumber: false,
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "المسمى الوظيفي",
                ),
                const VirticalSpace(1.5),
                BlocProvider(
                  create: (context) =>
                      CategoriesSkillsBloc(DependencyInjection.provideCsRepo())
                        ..add(GetJobTitlesEvent()),
                  child:
                      BlocBuilder<CategoriesSkillsBloc, CategoriesSkillsState>(
                    builder: (context, state) {
                      if (state is CSLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CSError) {
                        return Center(
                          child: Text(state.err),
                        );
                      } else if (state is JobTitlesLoadedState ||
                          state is JobTitleSelected) {
                        List<JobTitle> jobTitles = [];
                        int? selectedJobtitileId;

                        if (state is JobTitlesLoadedState) {
                          jobTitles = state.jobTitles;
                        } else if (state is JobTitleSelected) {
                          jobTitles = state.jobTitles;
                          selectedJobtitileId = state.selectedJobTitleId;
                          _selectedJobTitleId = selectedJobtitileId;
                        }

                        return Column(
                          children: [
                            CustomDropdownSearchJobTitle(
                              cst: jobTitles,
                              onJobTitleSelected: (int? selectedId) {
                                if (selectedId != null) {
                                  context
                                      .read<CategoriesSkillsBloc>()
                                      .add(JobTitleSelectedEvent(selectedId));
                                }
                              },
                              initialSelectedId: selectedJobtitileId,
                            ),
                            if (selectedJobtitileId != null)
                              Text(
                                  "Selected job title ID: $selectedJobtitileId"),
                          ],
                        );
                      } else {
                        return Center(child: Text("Unexpected state"));
                      }
                    },
                  ),
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "التصنيف",
                ),
                const VirticalSpace(1.5),
                BlocProvider(
                  create: (context) =>
                      CategoriesSkillsBloc(DependencyInjection.provideCsRepo())
                        ..add(GetCategoriesEvent()),
                  child:
                      BlocBuilder<CategoriesSkillsBloc, CategoriesSkillsState>(
                    builder: (context, state) {
                      if (state is CSLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CSError) {
                        return Center(
                          child: Text(state.err),
                        );
                      } else if (state is CategoriesLoadedState ||
                          state is CategorySelectedState) {
                        List<Category> categories = [];
                        int? selectedCategoryId;

                        if (state is CategoriesLoadedState) {
                          categories = state.categories;
                          print('true');
                        } else if (state is CategorySelectedState) {
                          categories = state.categories;
                          selectedCategoryId = state.selectedCategoryId;
                        }

                        return Column(
                          children: [
                            CustomDropdownSearchCategory(
                              cst: categories,
                              onCategorySelected: (int? selectedId) {
                                if (selectedId != null) {
                                  context
                                      .read<CategoriesSkillsBloc>()
                                      .add(CategorySelectedEvent(selectedId));
                                  print("true2");
                                }
                              },
                              initialSelectedId: selectedCategoryId,
                            ),
                            if (selectedCategoryId != null)
                              Text("Selected category ID: $selectedCategoryId"),
                            SizedBox(),
                          ],
                        );
                      } else {
                        return Center(child: Text("Unexpected state"));
                      }
                    },
                  ),
                ),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "Skills",
                ),
                const VirticalSpace(1.5),
                const CustomShowChipButton(),
                const VirticalSpace(2),
          //      const ShowChip(), TODO
                const VirticalSpace(4),
                AddEditProto(
                  text: "Add Protofolio Project",
                  onTap: () {
                    GoRouter.of(context).push('/addprotofolio');
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

                      context.read<ProfileBloc>().add(CreateClientProfileEvent(
                            description: _descriptionController.text,
                            jobTitleId: _selectedJobTitleId!,
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
      BuildContext context, ClientProfileCreatedState state) {
    // Add photo to profile
    if (_selectedPhotoId != null) {
      context.read<ProfileBloc>().add(AddPhotoToClientProfileEvent(
            state.clientProfile.id!,
            _selectedPhotoId!,
          ));
    }

    // Add skills to profile
    if (_selectedSkillId != null && _selectedSkillId!.isNotEmpty) {
      context.read<ProfileBloc>().add(AddSkillToClientProfileEvent(
            state.clientProfile.id!,
            _selectedSkillId![0],
          ));
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile created successfully!')),
    );

    // Navigate to the next screen or perform any other action
    // For example:
     GoRouter.of(context).push('/homescreen');
  }
}
