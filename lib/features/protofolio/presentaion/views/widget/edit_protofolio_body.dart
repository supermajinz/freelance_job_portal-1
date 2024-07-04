import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';

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
                  initvalue: "Order Management App",
                  hinttext: "",
                  lable: "Protofolio Name",
                  isNumber: false),
              const VirticalSpace(2),
              const EditTextForm(
                  initvalue:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.....",
                  hinttext: "",
                  lable: "Descripion",
                  isNumber: false),
              const VirticalSpace(5),
              const Text(
                "Images",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(2),
              SizedBox(
                height: SizeConfig.defaultSize! * 21,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: SizeConfig.defaultSize! * 20,
                            width: SizeConfig.defaultSize! * 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.defaultSize! * 1.6)),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage("assets/images/pro.jpg"))),
                          ),
                          Positioned(
                            top: SizeConfig.defaultSize! * 17,
                            right: SizeConfig.defaultSize! * 12,
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
                height: SizeConfig.defaultSize! * 10,
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
              const VirticalSpace(5),
              const Row(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  HorizintalSpace(20),
                  Column(
                    children: [
                      CustomDate(),
                      Text(
                        "14/7/2022",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const VirticalSpace(5),
              const EditTextForm(
                  initvalue: "https://docs.google.com/d/10qgrbMt3I",
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
