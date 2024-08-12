// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
//import 'package:freelance_job_portal/features/categories%20and%20skills/models/categories/category.dart';

import 'package:freelance_job_portal/features/categories%20and%20skills/models/job_title.dart';

//import 'package:freelance_job_portal/features/categories%20and%20skills/models/skill.dart';
/*
class CustomDropdownSearsh1 extends StatelessWidget {
  const CustomDropdownSearsh1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomDropdownSearch();
  }
}


class CustomDropdownSearch extends StatelessWidget {
  const CustomDropdownSearch({
    super.key,
  });

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
        // ProfileBloc: Event Choosed Item
      },
      // selectedItem: null,
      selectedItem: "Software Development",
    );
  }
}
*/
class CustomDropdownSearchJobTitle extends StatelessWidget {
  final List<JobTitle> cst;
  final Function(int?) onJobTitleSelected;
  final int? initialSelectedId;

  const CustomDropdownSearchJobTitle({
    super.key,
    required this.cst,
    required this.onJobTitleSelected,
    this.initialSelectedId,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<JobTitle>(
      items: cst,
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
            title: Text(item.title ?? ''),
          );
        },
      ),
      onChanged: (value) {
        onJobTitleSelected(value?.id);
      },
      itemAsString: (JobTitle? jobTitle) => jobTitle?.title ?? '',
      selectedItem: cst.firstWhere(
        (category) => category.id == initialSelectedId,
        orElse: () => cst.first,
      ),
    );
  }
}
/*
class CustomDropdownSearchCategory extends StatelessWidget {
  final List<Category> cst;
  final Function(int?) onCategorySelected;
  final int? initialSelectedId;

  const CustomDropdownSearchCategory({
    Key? key,
    required this.cst,
    required this.onCategorySelected,
    this.initialSelectedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Category>(
      items: cst,
      itemAsString: (Category category) => "   ${category.name}",
      onChanged: (Category? category) {
        onCategorySelected(category?.id);
        print('widget: ${category?.id}');
      },
      selectedItem: cst.firstWhere(
        (category) => category.id == initialSelectedId,
        orElse: () => cst.first,
      ),
    );
  }
}

class CustomDropdownSearchSkill extends StatelessWidget {
  final List<Skill> skills;
  final Function(int?) onSkillSelected;
  final int? initialSelectedId;

  const CustomDropdownSearchSkill({
    super.key,
    required this.skills,
    required this.onSkillSelected,
    this.initialSelectedId,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Skill>(
      items: skills,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: 'Select a skill',
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
            title: Text(item.name ?? ''),
          );
        },
      ),
      onChanged: (value) {
        onSkillSelected(value?.id);
      },
      itemAsString: (Skill? skill) => skill?.name ?? '',
      selectedItem: skills.isNotEmpty
          ? skills.firstWhere(
              (skill) => skill.id == initialSelectedId,
              orElse: () => skills.first,
            )
          : null,
    );
  }
}
*/
