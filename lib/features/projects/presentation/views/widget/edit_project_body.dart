import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:freelance_job_portal/features/projects/presentation/view_models/bloc/project_bloc.dart';
import '../../../../profile/presentation/views/widget/custom_chip_button.dart';
import '../../../data/model/edit_project_model.dart';

class EditProjectBody extends StatefulWidget {
  const EditProjectBody({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  State<EditProjectBody> createState() => _EditProjectBodyState();
}

class _EditProjectBodyState extends State<EditProjectBody> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController minBudgetController;
  late final TextEditingController maxBudgetController;
  late final TextEditingController durationController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.projectModel.name);
    descriptionController =
        TextEditingController(text: widget.projectModel.description);
    minBudgetController =
        TextEditingController(text: widget.projectModel.minBudget.toString());
    maxBudgetController =
        TextEditingController(text: widget.projectModel.maxBudget.toString());
    durationController = TextEditingController(
        text: widget.projectModel.expectedDuration.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(children: [
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize! * 1.5,
            vertical: SizeConfig.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VirticalSpace(4),
            EditTextForm(
                onTapicon: () {},
                mycontroller: titleController,
                hinttext: "",
                lable: "Title",
                isNumber: false),
            const VirticalSpace(3),
            EditTextForm(
                onTapicon: () {},
                mycontroller: descriptionController,
                hinttext: "",
                lable: "Discripion",
                isNumber: false),
            const VirticalSpace(6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const CustomSubTitle(text: "Min Budget"),
                      const VirticalSpace(2),
                      CustomEditMeonyGeneral(
                        isNumber: true,
                        mycontroller: minBudgetController,
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
                      CustomEditMeonyGeneral(
                        isNumber: true,
                        mycontroller: maxBudgetController,
                        onTapicon: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
            const VirticalSpace(5),
            const CustomSubTitle(text: "Duration"),
            const VirticalSpace(2),
            EditTextForm(
              onTapicon: () {},
              mycontroller: durationController,
              hinttext: "",
              lable: "Duration",
              isNumber: true,
            ),
            const VirticalSpace(5),
            const CustomSubTitle(text: "Category"),
            const VirticalSpace(1.5),
            const CustomDropdownSearsh1(),
            const VirticalSpace(5),
            const CustomSubTitle(text: "Skills"),
            const VirticalSpace(1.5),
            const CustomDropdownSearsh1(),
            const VirticalSpace(2),
            const CustomShowChipButton(),
            const VirticalSpace(7),
            Builder(builder: (context) {
              return BlocConsumer<ProjectBloc, ProjectState>(
                listener: (context, state) {
                  if (state is EditProjectSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("تم تعديل المشروع بنجاح")),
                    );
                    // Show success message or navigate to another screen
                  } else if (state is ProjectError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: CustomButtonGeneral(
                      onPressed: () {
                        final project = EditProjectModel(
                          name: titleController.text,
                          description: descriptionController.text,
                          minBudget: int.parse(minBudgetController.text),
                          maxBudget: int.parse(maxBudgetController.text),
                          expectedDuration: int.parse(durationController.text),
                          status: "close",
                          projectSkillIds: const [1, 2],
                          projectCategoriesIds: const [1],
                        );
                        context
                            .read<ProjectBloc>()
                            .add(UpdateProject(1, project));
                      },
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "Save",
                      borderSide: const BorderSide(),
                      width: SizeConfig.defaultSize! * 20,
                    ),
                  );
                },
              );
            })
          ],
        ),
      )
    ]);
  }
}

class CustomDropdownSearsh1 extends StatelessWidget {
  const CustomDropdownSearsh1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomDropdownSearch();
  }
}

class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: const [
        'Design',
        'Software Development',
        'Data Analysis',
        'Project Management',
      ],
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: '',
          hintStyle: Theme.of(context).textTheme.labelLarge,
          border: const OutlineInputBorder(),
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          return ListTile(
            title: Text(item),
          );
        },
      ),
      onChanged: (value) {
        // print('Selected: $value');
      },
      // selectedItem: null,
      selectedItem: "Software Development",
    );
  }
}

class CustomShowChipButton extends StatelessWidget {
  const CustomShowChipButton({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> items = List.generate(5, (i) => i);

    return Wrap(
      spacing: SizeConfig.defaultSize! * 1,
      direction: Axis.horizontal,
      runSpacing: SizeConfig.defaultSize! * .5,
      children: items
          .map((i) => const CustomChipButton(
                text: "Fluter developer",
              ))
          .toList(),
    );
  }
}
