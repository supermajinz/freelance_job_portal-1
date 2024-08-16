import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/nav_bar_bloc/nav_bar_event.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/range_slider_budget.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/renge_slider_deadLine.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../home/data/model/caregories/caregories.dart';
import '../../../../home/data/model/skills/skills.dart';
import '../../../../home/presentation/view_models/home_bloc/home_bloc.dart';

class SortBody extends StatefulWidget {
  const SortBody({super.key, required this.filters});
  final Map<String, dynamic> filters;

  @override
  State<SortBody> createState() => _SortBodyState();
}

class _SortBodyState extends State<SortBody> {
  List<Categories> _selectedCategories = [];
  List<Skills> selectedSkills = [];
  int? minBudget;
  int? maxBudget;
  int? minDuration;
  int? maxDuration;
  @override
  void initState() {
    _selectedCategories = widget.filters["categories"] ?? [];
    selectedSkills = widget.filters["skills"] ?? [];
    minBudget = widget.filters["minBudget"];
    maxBudget = widget.filters["maxBudget"];
    maxDuration = widget.filters["maxDuration"];
    minDuration = widget.filters["minDuration"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VirticalSpace(2),
              const CustomSubTitle(
                text: 'حسب التصنيفات',
              ),
              const VirticalSpace(1.5),
              CustomDropdownSearchCategories(
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategories.add(value);
                      selectedSkills.clear();
                    });
                  }
                },
              ),
              const VirticalSpace(2),
              CustomShowChipButton(
                projectItems: _selectedCategories
                    .map((category) => category.name)
                    .toList(),
                onDelete: (name) {
                  setState(() {
                    _selectedCategories
                        .removeWhere((element) => element.name == name);
                  });
                },
              ),
              const VirticalSpace(5),
              const CustomSubTitle(text: 'حسب المهارات'),
              const VirticalSpace(1.5),
              CustomDropdownSearchSkills(
                categories: _selectedCategories,
                onChanged: (value) {
                  if (value != null && !selectedSkills.contains(value)) {
                    setState(() {
                      selectedSkills.add(value);
                    });
                  }
                },
              ),
              const VirticalSpace(2),
              CustomShowChipButton(
                projectItems:
                    selectedSkills.map((skill) => skill.name).toList(),
                onDelete: (name) {
                  setState(() {
                    selectedSkills
                        .removeWhere((element) => element.name == name);
                  });
                },
              ),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "حسب المدة",
              ),
              const VirticalSpace(2),
              RangeSliderDeadLine(
                  onChanged: (min, max) {
                    minDuration = min;
                    maxDuration = max;
                  },
                  init: RangeValues(minDuration?.toDouble() ?? 1,
                      maxDuration?.toDouble() ?? 150)),
              const VirticalSpace(3),
              const CustomSubTitle(
                text: "حسب الميزانية",
              ),
              const VirticalSpace(2),
              RangeSliderBudget(
                  onChanged: (min, max) {
                    minBudget = min;
                    maxBudget = max;
                  },
                  init: RangeValues(minBudget?.toDouble() ?? 500000,
                      maxBudget?.toDouble() ?? 50000000)),
              const VirticalSpace(9),
              Center(
                child: CustomButtonGeneral(
                    onPressed: () {
                      final selectedFilters = {
                        if (_selectedCategories.isNotEmpty)
                          'categories': _selectedCategories,
                        if (selectedSkills.isNotEmpty) 'skills': selectedSkills,
                        if (minBudget != null) 'minBudget': minBudget,
                        if (maxBudget != null) 'maxBudget': maxBudget,
                        if (minDuration != null) 'minDuration': minDuration,
                        if (maxDuration != null) 'maxDuration': maxDuration,
                      };
                      context
                          .read<NavigationBloc>()
                          .add(PageTapped(2, args: selectedFilters));
                      GoRouter.of(context).pushReplacement('/homescreen');
                    },
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "فرز",
                    borderSide: const BorderSide(width: 0),
                    width: SizeConfig.defaultSize! * 20),
              ),
              const VirticalSpace(2),
            ],
          ),
        )
      ],
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
  final List<Categories> categories;

  const CustomDropdownSearchSkills(
      {super.key, required this.onChanged, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) {
          return const CircularProgressIndicator();
        }
        return DropdownSearch<Skills>(
          items: _getSkills(categories, state.skillsByCategory),
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

  _getSkills(
      List<Categories> categories, Map<int, List<Skills>> skillsByCategory) {
    final skills = <Skills>[];
    skillsByCategory.entries
        .where((element) =>
            categories.any((category) => category.id == element.key))
        .forEach((e) => skills.addAll(e.value));
    return skills;
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
      deleteIcon: const Icon(Icons.close),
      onDeleted: onDeleted,
      selectedColor: const Color.fromARGB(255, 200, 225, 245),
      label: CustomLabel(text: text),
      selected: true,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * 1))),
      showCheckmark: false,
      labelPadding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
      padding: EdgeInsets.all(SizeConfig.defaultSize! * .5),
    );
  }
}
