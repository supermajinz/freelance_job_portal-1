import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_edit_proto.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_show_chip_button.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_photo_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const EditPhotoProfile(),
                  Positioned(
                    top: SizeConfig.defaultSize! * 9,
                    left: SizeConfig.defaultSize! * 9.5,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit)),
                  )
                ],
              ),
              const VirticalSpace(5),
              const Row(
                children: [
                  Expanded(
                    child: EditTextForm(
                        initvalue: "Ahmad",
                        hinttext: "",
                        lable: "First Name",
                        isNumber: false),
                  ),
                  HorizintalSpace(.5),
                  Expanded(
                    child: EditTextForm(
                        initvalue: "Murad",
                        hinttext: "",
                        lable: "Last Name",
                        isNumber: false),
                  )
                ],
              ),
              const VirticalSpace(2),
              const EditTextForm(
                  initvalue:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.....",
                  hinttext: "",
                  lable: "Descripion",
                  isNumber: false),
              const VirticalSpace(4),
              const CustomSubTitle(
                text: "Edit Descriptor Images",
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
              const VirticalSpace(4),
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
                text: "Edit Protofolio Project",
                onTap: () {
                  GoRouter.of(context).push("/editprotofolio");
                },
              ),
              const VirticalSpace(6),
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
