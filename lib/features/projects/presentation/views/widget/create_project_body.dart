import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony_general.dart';
import '../../../../../core/widget/custom_sub_title.dart';
import '../../../../../core/widget/custom_text_form_general.dart';
import '../../../../../core/widget/space.dart';
import '../../../data/model/create_project_model.dart';
import '../../view_models/bloc/project_bloc.dart';

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
  final List<int> _selectedCategoryIds = [];
  final List<int> _selectedSkillIds = [];

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
                    if (value != null &&
                        !_selectedCategoryIds.contains(value)) {
                      setState(() {
                        _selectedCategoryIds.add(value);
                      });
                    }
                  },
                ),
                const VirticalSpace(2),
                CustomShowChipButton(
                  projectItems:
                      _selectedCategoryIds.map((id) => id.toString()).toList(),
                  onDelete: (category) {
                    setState(() {
                      _selectedCategoryIds.remove(int.parse(category));
                    });
                  },
                ),
                const VirticalSpace(5),
                const CustomSubTitle(text: "Skills"),
                const VirticalSpace(1.5),
                CustomDropdownSearchSkills(
                  onChanged: (value) {
                    if (value != null && !_selectedSkillIds.contains(value)) {
                      setState(() {
                        _selectedSkillIds.add(value);
                      });
                    }
                  },
                ),
                const VirticalSpace(2),
                CustomShowChipButton(
                  projectItems:
                      _selectedSkillIds.map((id) => id.toString()).toList(),
                  onDelete: (skill) {
                    setState(() {
                      _selectedSkillIds.remove(int.parse(skill));
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
                          // Navigate back or to project details
                        } else if (state is ProjectError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomButtonGeneral(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final project = CreateProjectModel(
                                name: _titleController.text,
                                description: _descriptionController.text,
                                minBudget: int.parse(_minBudgetController.text),
                                maxBudget: int.parse(_maxBudgetController.text),
                                expectedDuration:
                                    int.parse(_expectedDurationController.text),
                                clientProfileId:
                                    1, // Assuming a default value, replace with actual client profile ID
                                projectSkillIds: _selectedSkillIds,
                                projectCategoriesIds: _selectedCategoryIds,
                              );
                              context.read<ProjectBloc>().add(
                                    CreateProjectSubmitted(project: project),
                                  );
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          text: state is ProjectLoading
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
  final Function(int?) onChanged;

  const CustomDropdownSearchCategories({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<int>(
      items: const [1, 2, 3, 4], // قم بتغيير هذه إلى معرفات الفئات الفعلية
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
                'Category $item'), // قم بتغيير هذا لعرض أسماء الفئات الفعلية
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}

class CustomDropdownSearchSkills extends StatelessWidget {
  final Function(int?) onChanged;

  const CustomDropdownSearchSkills({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<int>(
      items: const [1, 2, 3, 4], // قم بتغيير هذه إلى معرفات المهارات الفعلية
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
                'Skill $item'), // قم بتغيير هذا لعرض أسماء المهارات الفعلية
          );
        },
      ),
      onChanged: onChanged,
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
