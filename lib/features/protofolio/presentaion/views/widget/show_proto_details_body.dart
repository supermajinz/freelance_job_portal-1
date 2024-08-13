import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/skill_dt_o.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_list_view_image.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/image_gallery_widget.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_custom_profile_card.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/image_gallery_viewer.dart';
import 'package:intl/intl.dart';

class ShowProtoDetailsBody extends StatelessWidget {
  final PortofolioJob job;
  const ShowProtoDetailsBody({super.key, required this.job});

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
              Center(
                child: CustomSubTitle(
                  text: job.name!,
                ),
              ),
              const VirticalSpace(2),
              Text(job.description!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
              const VirticalSpace(4),
            ],
          ),
        ),
        ImageGalleryViewer(
            imageUrls: job.photoDtOs!.map((e) => e.photo!).toList()),
        const VirticalSpace(4),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSubTitle(
                text: "المهارات المستعملة",
              ),
              const VirticalSpace(2),
              job.skillDtOs!.isNotEmpty
                  ? ShowChip(
                      skills: job.skillDtOs!
                          .map((e) => SkillDtO(id: e.id, name: e.name!))
                          .toList()) //currentProfile.skillDtOs!,
                  : const VirticalSpace(2),
              const VirticalSpace(5),
              Row(
                children: [
                  const CustomSubTitle(
                    text: "التاريخ",
                  ),
                  const Spacer(),
                  CustomBody(
                    text: DateFormat('yyyy-MM-dd').format(job.date!),
                  ),
                  // const Spacer()
                ],
              ),
              const VirticalSpace(2),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_outlined)),
                          CustomLabel(
                            text: job.viewsNo.toString(),
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
                          CustomLabel(
                            text: job.likeNo.toString(),
                            color: Colors.black,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              //const VirticalSpace(5),
              //const EditTextForm(
              // initvalue: "https://docs.google.com/d/10qgrbMt3I",
              //  hinttext: "",
              //lable: "Link",
              //isNumber: false),
            ],
          ),
        ),
      ],
    );
  }
}
