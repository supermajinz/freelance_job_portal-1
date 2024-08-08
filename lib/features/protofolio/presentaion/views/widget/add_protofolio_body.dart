import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_descriptor_images.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';
import '../../../../profile/presentation/views/widget/custom_show_chip_button.dart';

class AddProtofolioBody extends StatelessWidget {
  const AddProtofolioBody({super.key});

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
              const VirticalSpace(2),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Protofolio Name", isNumber: false),
              const VirticalSpace(2),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Discripion", isNumber: false),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Images",
              ),
              const VirticalSpace(2),
              const AddDescriptorImages(),
              const VirticalSpace(7),
              const CustomSubTitle(
                text: "Category",
              ),
              const VirticalSpace(1.5),
        //      const CustomDropdownSearsh1(),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Skills",
              ),
              const VirticalSpace(1.5),
          //    const CustomDropdownSearsh1(),
              const VirticalSpace(2),
              const CustomShowChipButton(),
              const VirticalSpace(2),
          //    const ShowChip(), //TODO
              const VirticalSpace(5),
              const Row(
                children: [
                  CustomSubTitle(
                    text: "Date",
                  ),
                  HorizintalSpace(20),
                  Column(
                    children: [
                      CustomDate(),
                      CustomBody(
                        text: "14/7/2022",
                      )
                    ],
                  ),
                ],
              ),
              const VirticalSpace(5),
              const CustomTextFormGeneral(
                  hinttext: "", lable: "Link", isNumber: false),
              const VirticalSpace(5),
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
