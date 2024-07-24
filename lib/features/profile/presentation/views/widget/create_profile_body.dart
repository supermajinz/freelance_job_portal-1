import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_edit_proto.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_photo_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_show_chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';

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
              const VirticalSpace(5),
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
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Category",
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Skills",
              ),
              const VirticalSpace(1.5),
              const CustomDropdownSearsh1(),
              const VirticalSpace(2),
            const CustomShowChipButton(),
              const VirticalSpace(2),
              const ShowChip(),
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
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "Create",
                      borderSide: const BorderSide(width: 0),
                      width: SizeConfig.defaultSize! * 20)),
            ],
          ),
        )
      ],
    );
  }
}
