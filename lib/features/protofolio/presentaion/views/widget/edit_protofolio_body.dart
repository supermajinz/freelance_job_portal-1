import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';
import '../../../../profile/presentation/views/widget/custom_show_chip_button.dart';

class EditProtofolioBody extends StatelessWidget {
  const EditProtofolioBody({super.key});

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
              const EditTextForm(
                  // initvalue: "Order Management App",
                  hinttext: "",
                  lable: "Protofolio Name",
                  isNumber: false),
              const VirticalSpace(2),
              const EditTextForm(
                  // initvalue:
                  // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.....",
                  hinttext: "",
                  lable: "Descripion",
                  isNumber: false),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Images",
              ),
              const VirticalSpace(2),
              SizedBox(
                height: SizeConfig.defaultSize! * 18,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AspectRatio(
                            aspectRatio: 3.7 / 4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.defaultSize! * 1.6)),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage("assets/images/pro.jpg"))),
                            ),
                          ),
                          Positioned(
                            top: SizeConfig.defaultSize! * 14.5,
                            right: SizeConfig.defaultSize! * 13,
                            child: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const HorizintalSpace(1);
                    },
                    itemCount: 5),
              ),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Category",
              ),
              const VirticalSpace(1.5),
              //    const CustomDropdownSearsh1(),
              const VirticalSpace(5),
              const CustomSubTitle(
                text: "Skills",
              ),
              const VirticalSpace(1.5),
              //         const CustomDropdownSearsh1(),
              const VirticalSpace(2),
              const CustomShowChipButton(),
              const VirticalSpace(2),
              //  const ShowChip(), //TODO
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
              const EditTextForm(
                  // initvalue: "https://docs.google.com/d/10qgrbMt3I",
                  hinttext: "",
                  lable: "Link",
                  isNumber: false),
              const VirticalSpace(5),
              Center(
                  child: CustomButtonGeneral(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      textcolor: Colors.white,
                      text: "Save",
                      borderSide: const BorderSide(width: 0),
                      width: SizeConfig.defaultSize! * 20)),
            ],
          ),
        )
      ],
    );
  }
}
