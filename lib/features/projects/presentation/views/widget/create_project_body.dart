import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony_general.dart';
import '../../../../../core/widget/custom_sub_title.dart';
import '../../../../../core/widget/custom_text_form_general.dart';
import '../../../../../core/widget/space.dart';
import '../../../data/model/create_project_model.dart';
import '../../view_models/project_bloc/project_bloc.dart';

class CreateProjectBody extends StatefulWidget {
  const CreateProjectBody({super.key});

  @override
  State<CreateProjectBody> createState() => _CreateProjectBodyState();
}

class _CreateProjectBodyState extends State<CreateProjectBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _minBudgetController = TextEditingController();
  final _maxBudgetController = TextEditingController();
  final _expectedDurationController = TextEditingController();
  Categories? _selectedCategory;
  final List<Skills> _selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultSize! * 1.5,
                vertical: SizeConfig.defaultSize! * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VirticalSpace(4),
                CustomTextFormGeneral(
                  hinttext: "",
                  lable: "Project Name",
                  isNumber: false,
                  mycontroller: _titleController,
                  onTapicon: () {},
                ),
                const VirticalSpace(3),
                CustomTextFormGeneral(
                  hinttext: "",
                  lable: "Description",
                  isNumber: false,
                  mycontroller: _descriptionController,
                  onTapicon: () {},
                ),
                const VirticalSpace(6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const CustomSubTitle(text: "Min Budget"),
                          const VirticalSpace(2),
                          CustomMeonyGeneral(
                            isNumber: true,
                            mycontroller: _minBudgetController,
                            onTapicon: () {},
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CustomSubTitle(text: "Max Budget"),
                          const VirticalSpace(2),
                          CustomMeonyGeneral(
                            isNumber: true,
                            mycontroller: _maxBudgetController,
                            onTapicon: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const VirticalSpace(5),
                const CustomSubTitle(text: "Expected Duration (in days)"),
                const VirticalSpace(2),
                CustomTextFormGeneral(
                  hinttext: "",
                  lable: "Duration",
                  isNumber: true,
                  mycontroller: _expectedDurationController,
                  obs: false,
                  onTapicon: () {},
                ),
                const VirticalSpace(5),
                const CustomSubTitle(text: "Categories"),
                const VirticalSpace(1.5),
                CustomDropdownSearchCategories(
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                        _selectedSkills.clear();
                      });
                    }
                  },
                ),
                // const VirticalSpace(2),
                // CustomShowChipButton(
                //   projectItems: _selectedCategory.map((e) => e.name).toList(),
                //   onDelete: (category) {
                //     setState(() {
                //       _selectedCategory.removeWhere(
                //         (element) => element.name == category,
                //       );
                //     });
                //   },
                // ),
                const VirticalSpace(5),
                const CustomSubTitle(text: "Skills"),
                const VirticalSpace(1.5),
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
                const VirticalSpace(7),
                Center(
                  child: Builder(builder: (context) {
                    return BlocConsumer<ProjectBloc, ProjectState>(
                      listener: (context, state) {
                        if (state is CreateProjectSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Project created successfully')),
                          );

                          GoRouter.of(context).pushReplacement(
                              '/showprojectdetails',
                              extra: state.project.id);
                          // Navigate back or to project details
                        } else if (state is CreateProjectLoading) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('جاري إنشاء المشروع.')),
                          );
                        } else if (state is ProjectError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                       // final authSate = context.read<AuthBloc>().state;
                        return CustomButtonGeneral(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _selectedCategory != null) {
                              
                              final project = CreateProjectModel(
                                name: _titleController.text,
                                description: _descriptionController.text,
                                minBudget: int.parse(_minBudgetController.text),
                                maxBudget: int.parse(_maxBudgetController.text),
                                expectedDuration:
                                    int.parse(_expectedDurationController.text),
                                clientProfileId: 1,
                                // Assuming a default value, replace with actual client profile ID
                                // GlobalData.instance.currentUser.clientProfile.id, // Assuming a default value, replace with actual client profile ID
                                projectSkillIds:
                                    _selectedSkills.map((e) => e.id).toList(),
                                projectCategory: _selectedCategory?.id,
                              );
                              context.read<ProjectBloc>().add(
                                    CreateProjectSubmitted(project: project),
                                  );
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          text: state is CreateProjectLoading
                              ? "Creating..."
                              : "Create",
                          borderSide: const BorderSide(),
                          width: SizeConfig.defaultSize! * 20,
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomDropdownSearchCategories extends StatelessWidget {
  final Function(Categories?) onChanged;

  const CustomDropdownSearchCategories({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const CircularProgressIndicator();
        }
        return DropdownSearch<Categories>(
          items: state.categories,
          // قم بتغيير هذه إلى معرفات الفئات الفعلية
          itemAsString: (item) => item.name,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: '',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              border: const OutlineInputBorder(),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                title:
                    Text(item.name), // قم بتغيير هذا لعرض أسماء الفئات الفعلية
              );
            },
          ),
          onChanged: onChanged,
        );
      },
    );
  }
}

class CustomDropdownSearchSkills extends StatelessWidget {
  final Function(Skills?) onChanged;
  final Categories? category;

  const CustomDropdownSearchSkills(
      {super.key, required this.onChanged, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const CircularProgressIndicator();
        }
        return DropdownSearch<Skills>(
          items: state.skillsByCategory[category?.id] ?? [],
          // itemAsString: (item) => item.name,
          itemAsString: (item) => "",
          // قم بتغيير هذه إلى معرفات المهارات الفعلية
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: '',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              border: const OutlineInputBorder(),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true,
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(
                    item.name), // قم بتغيير هذا لعرض أسماء المهارات الفعلية
              );
            },
          ),
          onChanged: onChanged,
        );
      },
    );
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

class CustomChipButton extends StatelessWidget {
  const CustomChipButton({super.key, this.onDeleted, required this.text});

  final void Function()? onDeleted;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      deleteIcon: const Icon(Icons.cancel_outlined),
      onDeleted: onDeleted,
      selectedColor: const Color.fromARGB(255, 200, 225, 245),
      label: CustomLabel(text: text),
      selected: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 3))),
      showCheckmark: false,
      labelPadding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
      padding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
    );
  }
}
