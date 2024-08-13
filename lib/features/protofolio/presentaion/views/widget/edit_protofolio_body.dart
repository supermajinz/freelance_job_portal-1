import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_image_gallery_widget.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/create_project_body.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/photo_dt_o.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/skill_dt_o.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/edit_gallery.dart';
import 'package:go_router/go_router.dart';
import '../../../../profile/presentation/views/widget/custom_show_chip_button.dart';

class EditProtofolioBody extends StatefulWidget {
  final PortofolioJob job;
  const EditProtofolioBody({super.key, required this.job});

  @override
  State<EditProtofolioBody> createState() => _EditProtofolioBodyState();
}

class _EditProtofolioBodyState extends State<EditProtofolioBody> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;

  Categories? category;
  late final List<SkillDtO> skills;
  late final List<PhotoDtO> photos;
  late final DateTime date;
  @override
  void dispose() {
    nameController.clear();
    descriptionController.clear();
    skills.clear();
    photos.clear();
    super.dispose();
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.job.name!);
    descriptionController =
        TextEditingController(text: widget.job.description!);
    skills = widget.job.skillDtOs!;
    photos = widget.job.photoDtOs!;
    date = widget.job.date!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortofolioBloc, PortofolioState>(
      listener: (context, state) {
        if (state is PortofolioEdited) {
          GoRouter.of(context).pushReplacement('/homescreen');
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Portfolio edited successfully!')));
        } else if (state is PortofolioError) {
          print('editPort ${state.message}');
          // Show error message to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
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
                  EditTextForm(
                      mycontroller: nameController,
                      // initvalue: "Order Management App",
                      hinttext: "",
                      lable: "اسم العمل",
                      isNumber: false),
                  const VirticalSpace(2),
                  EditTextForm(
                      mycontroller: descriptionController,
                      // initvalue:
                      // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.....",
                      hinttext: "",
                      lable: "الوصف",
                      isNumber: false),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "الصور",
                  ),
                  /*   const VirticalSpace(2),
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
                 */
                  EditPortofolioImageGalleryWidget(
                      selectedPhotos: photos,
                      onPhotoUploaded: (int e) {
                        photos.add(PhotoDtO(id: e, photo: "z"));
                      },
                      onPhotoDeleted: (int e) {
                        photos.removeWhere((photo) => photo.id == e);
                      }),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "الصنف",
                  ),
                  const VirticalSpace(1.5),
                  CustomDropdownSearchCategories(onChanged: (e) {
                    setState(() {
                      category = e;
                      skills.clear();
                    });
                  }),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "المهارات",
                  ),
                  const VirticalSpace(1.5),
                  CustomDropdownSearchSkills(
                      onChanged: (e) {
                        setState(() {
                          skills.add(SkillDtO(id: e!.id, name: e.name));
                        });
                      },
                      category: category),
                  const VirticalSpace(2),
                  const VirticalSpace(2),
                  CustomShowChipButton(
                      projectItems: skills.map((e) => e.name!).toList(),
                      onDelete: (e) {
                        skills.removeWhere((skill) => skill.name! == e);
                      }),
                  const VirticalSpace(5),
                  Row(
                    children: [
                      CustomSubTitle(
                        text: "التاريخ",
                      ),
                      HorizintalSpace(20),
                      Column(
                        children: [
                          CustomDate(
                            initialDate: date,
                            onDateSelected: (selectedDate) {
                              setState(() {
                                date = selectedDate;
                              });
                            },
                          ),
                          CustomBody(
                            text: "${date.day}/${date.month}/${date.year}",
                          )
                        ],
                      ),
                    ],
                  ),
                  const VirticalSpace(5),
                  // const EditTextForm(
                  // initvalue: "https://docs.google.com/d/10qgrbMt3I",
                  //   hinttext: "",
                  // lable: "Link",
                  //isNumber: false),
                  const VirticalSpace(5),
                  Center(
                      child: CustomButtonGeneral(
                          onPressed: () {
                            context
                                .read<PortofolioBloc>()
                                .add(EditPortofolioJob(jobData: {
                                  "name": nameController.text,
                                  "description": descriptionController.text,
                                  "date": date.toIso8601String(),
                                  "photoIds": photos.map((e) => e.id!).toList(),
                                  "skillIds": skills.map((e) => (e.id)).toList()
                                }, jobId: widget.job.id!));
                          },
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
      },
    );
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
