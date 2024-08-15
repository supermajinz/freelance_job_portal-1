import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/project_model.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../home/data/model/skills/skills.dart';
import '../../../../home/presentation/view_models/home_bloc/home_bloc.dart';
import '../../../data/model/edit_project_model.dart';
import '../../view_models/project_bloc/project_bloc.dart';

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
  late Categories? category;
  late final List<Skills> skills;

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
    category = widget.projectModel.projectCategory;
    skills = widget.projectModel.projectSkill;
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
                lable: "اسم المشروع",
                isNumber: false),
            const VirticalSpace(3),
            EditTextForm(
                onTapicon: () {},
                mycontroller: descriptionController,
                hinttext: "",
                lable: "وصف المشروع",
                isNumber: false),
            const VirticalSpace(6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const CustomSubTitle(text: "الحدالادنى للميزانية"),
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
                      const CustomSubTitle(text: "الحد الاعلى للميزانية"),
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
            const CustomSubTitle(text: "المدة المتوقعة (خلال ايام)"),
            const VirticalSpace(2),
            EditTextForm(
              onTapicon: () {},
              mycontroller: durationController,
              hinttext: "",
              lable: "المدة",
              isNumber: true,
            ),
            const VirticalSpace(5),
            const CustomSubTitle(text: "اختر تصنيف"),
            const VirticalSpace(1.5),
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
            const CustomSubTitle(text: "اختر مهارات"),
            const VirticalSpace(1.5),
            CustomDropdownSearchSkills(
              category: category,
              onChanged: (value) {
                if (value != null && !skills.contains(value)) {
                  setState(() {
                    skills.add(value);
                  });
                }
              },
            ),
            const VirticalSpace(2),
            CustomShowChipButton(
              projectItems: skills.map((skill) => skill.name).toList(),
              onDelete: (name) {
                setState(() {
                  skills.removeWhere((element) => element.name == name);
                });
              },
            ),
            const VirticalSpace(7),
            Builder(builder: (context) {
              return BlocConsumer<ProjectBloc, ProjectState>(
                listener: (context, state) {
                  if (state is EditProjectSuccess) {
                    widget.projectModel.update(state.project);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                          const SnackBar(
                              content: Text("تم تعديل المشروع بنجاح")),
                        )
                        .closed
                        .then((_) {
                      GoRouter.of(context).pop();
                    });
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
                          projectSkillIds: skills.map((e) => e.id).toList(),
                          projectCategoriesIds: category?.id,
                        );
                        context.read<ProjectBloc>().add(
                            UpdateProject(widget.projectModel.id, project));
                      },
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "حفظ التعديلات",
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
                title: Text(item.name),
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
                title: Text(item.name),
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
