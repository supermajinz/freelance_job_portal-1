import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_descriptor_images.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_photo_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_Chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';

class CreateProfileBody extends StatelessWidget {
  const CreateProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddPhotoProfile(),
              const VirticalSpace(4),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextFormGeneral(
                        hinttext: "", lable: "First Name", isNumber: false),
                  ),
                  HorizintalSpace(.5),
                  Expanded(
                    child: CustomTextFormGeneral(
                        hinttext: "", lable: "Last Name", isNumber: false),
                  )
                ],
              ),
              const VirticalSpace(2),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Discripion", isNumber: false),
              const VirticalSpace(3),
              const Text(
                "Add Descriptor Images",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(2),
              const AddDescriptorImages(),
              const VirticalSpace(7),
              const Text(
                "Category",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(5),
              const Text(
                "Skills",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(2),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CustomChipButton();
                    },
                    separatorBuilder: (context, index) {
                      return const HorizintalSpace(1);
                    },
                    itemCount: 4),
              ),
              const VirticalSpace(2),
              const ShowChip(),
              const VirticalSpace(4),
              Center(
                  child: CustomButtonGeneral(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "Create",
                      borderSide: const BorderSide(width: 0),
                      width: 200)),
            ],
          ),
        )
      ],
    );
  }
}
