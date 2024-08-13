import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/photo/bloc/image_bloc.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/worker_Profile/worker_profile.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/add_descriptor_images.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_dropdown_searsh.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/image_gallery_widget.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/create_project_body.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_date.dart';
import 'package:go_router/go_router.dart';
import '../../../../profile/presentation/views/widget/custom_show_chip_button.dart';

class AddProtofolioBody extends StatefulWidget {
  final int profileId;
  const AddProtofolioBody({super.key, required this.profileId});

  @override
  State<AddProtofolioBody> createState() => _AddProtofolioBodyState();
}

class _AddProtofolioBodyState extends State<AddProtofolioBody> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime dateOfJob = DateTime.now();
  Categories? _selectedCategory;
  List<Skills> _selectedSkills = [];
  List<int> _selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortofolioBloc, PortofolioState>(
      listener: (context, state) {
        if (state is PortofolioLoaded) {
          GoRouter.of(context).pushReplacement('/homescreen');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Portfolio created successfully!')),
          );
        } else if (state is PortofolioError) {
          // Show error message to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
        if (state is PortofolioLoaded) {
          setState(() {});
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
                  CustomTextFormGeneral(
                    mycontroller: _nameController,
                    hinttext: "",
                    lable: "اسم العمل",
                    isNumber: false,
                  ),
                  const VirticalSpace(2),
                  CustomTextFormGeneral(
                    mycontroller: _descriptionController,
                    hinttext: "",
                    lable: "الوصف",
                    isNumber: false,
                  ),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "Images",
                  ),
                  const VirticalSpace(2),
                  BlocProvider(
                    create: (context) =>
                        ImageBloc(DependencyInjection.providePhotoRepo()),
                    child: ImageGalleryWidget(
                      onPhotoUploaded: (int photoId) {
                        setState(() {
                          _selectedPhotos.add(photoId);
                        });
                        print('Uploaded Gallery Photo ID: $photoId');
                        print('All Gallery Photo IDs: $_selectedPhotos');
                      },
                    ),
                  ),
                  const VirticalSpace(7),
                  const CustomSubTitle(
                    text: "الصنف",
                  ),
                  const VirticalSpace(1.5),
                  CustomDropdownSearchCategories(onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                        _selectedSkills.clear();
                      });
                    }
                  }),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "المهارات",
                  ),
                  const VirticalSpace(1.5),
                  //    const CustomDropdownSearsh1(),
                  const VirticalSpace(2),
                  CustomDropdownSearchSkills(
                    category: _selectedCategory,
                    onChanged: (value) {
                      if (value != null && !_selectedSkills.contains(value)) {
                        setState(() {
                          _selectedSkills.add(value);
                        });
                      }
                    },
                  ),
                  const VirticalSpace(2),
                  CustomShowChipButton(
                    projectItems:
                        _selectedSkills.map((skill) => skill.name).toList(),
                    onDelete: (name) {
                      setState(() {
                        _selectedSkills
                            .removeWhere((element) => element.name == name);
                      });
                    },
                  ),
                  const VirticalSpace(5),
                  Row(
                    children: [
                      const CustomSubTitle(
                        text: "التاريخ",
                      ),
                      const HorizintalSpace(10),
                      Column(
                        children: [
                          CustomDate(
                            initialDate: dateOfJob,
                            onDateSelected: (selectedDate) {
                              setState(() {
                                dateOfJob = selectedDate;
                              });
                            },
                          ),
                          CustomBody(
                            text:
                                "${dateOfJob.day}/${dateOfJob.month}/${dateOfJob.year}",
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
                          onPressed: () {
                            context
                                .read<PortofolioBloc>()
                                .add(CreatePortofolioJob(jobData: {
                                  "workerProfileId": widget.profileId,
                                  "name": _nameController.text,
                                  "description": _descriptionController.text,
                                  "date": dateOfJob.toIso8601String(),
                                  "photoIds": _selectedPhotos,
                                  "skillIds": _selectedSkills
                                      .map((e) => (e.id))
                                      .toList(),
                                }));
                          },
                          color: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          text: "إنشاء",
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
