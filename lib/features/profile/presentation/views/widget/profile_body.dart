import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_review_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_zzz.dart';
import 'package:go_router/go_router.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  height: SizeConfig.defaultSize! * 25,
                  color: Colors.deepOrange,
                )),
            Positioned(
                top: SizeConfig.defaultSize! * 15,
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
                                      return const CustomProfileCard();
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
                            horizontal: SizeConfig.defaultSize! * 2),
                        child: const CustomProfileCard()))),
          ],
        ),
        Container(
            margin: EdgeInsets.only(
                top: SizeConfig.defaultSize! * 5,
                right: SizeConfig.defaultSize! * 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.desc_title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(.5),
                SizedBox(
                  height: SizeConfig.defaultSize! * 7,
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus....",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "show more",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const VirticalSpace(4),
                SizedBox(
                  height: SizeConfig.defaultSize! * 21,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: SizeConfig.defaultSize! * 20,
                          width: SizeConfig.defaultSize! * 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.defaultSize! * 1.6)),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/pro.jpg"))),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const HorizintalSpace(1);
                      },
                      itemCount: 5),
                ),
                const VirticalSpace(5),
                const Text(
                  "Skils",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(1),
                SizedBox(
                  height: SizeConfig.defaultSize! * 5,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const HorizintalSpace(0.3);
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CustomChoiceChip();
                    },
                  ),
                ),
                const VirticalSpace(4),
                const Text(
                  "Portfolio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(1.5),
                SizedBox(
                  height: SizeConfig.defaultSize! * 38.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            GoRouter.of(context).push("/showprotodetails");
                          },
                          child: const CustomProtofolioCard());
                    },
                  ),
                ),
                const VirticalSpace(3),
                const Text(
                  "Projects completed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(0.5),
                SizedBox(
                  height: SizeConfig.defaultSize! * 27,
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
                const Text(
                  "Ratings and reviews",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
