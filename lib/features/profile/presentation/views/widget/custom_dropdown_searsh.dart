import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

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
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: '',
          border: OutlineInputBorder(),
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
