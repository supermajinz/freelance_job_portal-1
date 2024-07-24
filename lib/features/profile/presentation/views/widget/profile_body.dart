import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_review_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';
import 'package:rating_summary/rating_summary.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: SizeConfig.defaultSize! * 22,
                  color: Theme.of(context).primaryColorLight,
                )),
            Positioned(
                top: SizeConfig.defaultSize! * 12,
                right: SizeConfig.defaultSize! * .5,
                left: SizeConfig.defaultSize! * .5,
                child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding:
                                EdgeInsets.all(SizeConfig.defaultSize! * 1),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 350,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const VirticalSpace(1);
                                    },
                                    scrollDirection: Axis.vertical,
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
                                      return CustomProfileCard(
                                        icon: Icons.edit,
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .push('/editprofile');
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const VirticalSpace(5),
                                CustomButtonGeneral(
                                    onPressed: () {
                                      GoRouter.of(context)
                                          .push("/createprofile");
                                    },
                                    color: Theme.of(context).primaryColor,
                                    textcolor: Colors.white,
                                    text: "Add New Profile",
                                    borderSide: const BorderSide(),
                                    width: SizeConfig.defaultSize! * 40)
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize! * 1),
                        child: CustomProfileCard(
                          icon: Icons.edit,
                          onPressed: () {
                            GoRouter.of(context).push('/editprofile');
                          },
                        )))),
          ],
        ),
        Container(
            margin: EdgeInsets.only(
                top: SizeConfig.defaultSize! * 5,
                right: SizeConfig.defaultSize! * 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSubTitle(text: "الوصف"),
                const VirticalSpace(1),
                SizedBox(
                  height: SizeConfig.defaultSize! * 7,
                  child: Container(
                    margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus....",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                const VirticalSpace(1),
                InkWell(
                  onTap: () {},
                  child: Text("show more",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                const VirticalSpace(4),
                const CustomSubTitle(
                  text: "المهارات",
                ),
                const VirticalSpace(.5),
               const ShowChip(),
                const VirticalSpace(4),
                const CustomSubTitle(
                  text: "Portfolio",
                ),
                const VirticalSpace(1.5),
                const CustomProtofolioCard(),
                const VirticalSpace(4),
                const CustomSubTitle(
                  text: "Projects completed",
                ),
                const VirticalSpace(0.5),
                SizedBox(
                  height: SizeConfig.defaultSize! * 29,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const HorizintalSpace(0.3);
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CustomProjectCard();
                    },
                  ),
                ),
                const VirticalSpace(5),
                const CustomZzz(),
                const VirticalSpace(5),
                const CustomSubTitle(
                  text: "Ratings and reviews",
                ),
                const VirticalSpace(4),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const RatingSummary(
                    color: Colors.purple,
                    counter: 13,
                    average: 5,
                    counterFiveStars: 8,
                    counterFourStars: 4,
                    counterThreeStars: 2,
                    counterTwoStars: 1,
                    counterOneStars: 1,
                  ),
                ),
                const VirticalSpace(6),
                SizedBox(
                  height: SizeConfig.defaultSize! * 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const CustomReviewCard();
                    },
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
