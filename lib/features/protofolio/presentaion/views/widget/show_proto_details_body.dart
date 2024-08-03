import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_list_view_image.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';

class ShowProtoDetailsBody extends StatelessWidget {
  const ShowProtoDetailsBody({super.key});

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
              const VirticalSpace(1),
              const Center(
                child: CustomSubTitle(
                  text: "Order Management App",
                ),
              ),
              const VirticalSpace(2),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
              const VirticalSpace(4),
            ],
          ),
        ),
        CustomListViewImage(),
        const VirticalSpace(4),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSubTitle(
                text: "Skills Used",
              ),
              const VirticalSpace(2),
              const ShowChip(),
              const VirticalSpace(5),
              const Row(
                children: [
                  CustomSubTitle(
                    text: "Date",
                  ),
                  HorizintalSpace(19),
                  CustomBody(
                    text: "14/7/2022",
                  ),
                ],
              ),
              const VirticalSpace(2),
              Row(
                children: [
                  const HorizintalSpace(22.8),
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_outlined)),
                          const CustomLabel(
                            text: "3000",
                            color: Colors.black,
                          )
                        ],
                      ),
                      const HorizintalSpace(1),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite)),
                          const CustomLabel(
                            text: "5000",
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const VirticalSpace(5),
              const EditTextForm(
                  // initvalue: "https://docs.google.com/d/10qgrbMt3I",
                  hinttext: "",
                  lable: "Link",
                  isNumber: false),
            ],
          ),
        ),
      ],
    );
  }
}
