import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_choice_chip.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_profile_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_protofolio_card.dart';
import 'package:rating_summary/rating_summary.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 250,
                  color: Colors.orange,
                )),
            const Positioned(
                top: 150, right: 15, left: 15, child: CustomProfileCard()),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 30, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Descripion",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 70,
                  child: Text(
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
                const VirticalSpace(3),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 7,
                            childAspectRatio: 1.5),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/proto1.jpg"))),
                      );
                    },
                  ),
                ),
                const VirticalSpace(3),
                const Text(
                  "Skils",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
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
                const VirticalSpace(3),
                const Text(
                  "Portfolio",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(0.5),
                SizedBox(
                  height: 360,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CustomProtofolioCard();
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
                  height: 250,
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
                const VirticalSpace(4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  margin: const EdgeInsets.only(right: 15, left: 5),
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Number of projects completed",
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          VirticalSpace(1),
                          CircleAvatar(
                            maxRadius: 30,
                            backgroundColor: Color.fromARGB(255, 69, 49, 100),
                            child: Text(
                              "17",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Percentage of projects delivered on deadline:",
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          VirticalSpace(1),
                          CircleAvatar(
                            maxRadius: 30,
                            backgroundColor: Color.fromARGB(255, 69, 49, 100),
                            child: Text(
                              "86%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const VirticalSpace(3),
                const Text(
                  "Ratings and reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const VirticalSpace(3),
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
                const VirticalSpace(4),
                SizedBox(
                  height: 400,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Column( 

                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                maxRadius: 30,
                                backgroundImage: AssetImage(
                                  "assets/images/pro.jpg",
                                ),
                              ),
                              const HorizintalSpace(1),
                              const Text(
                                "Sara",
                                style: TextStyle(fontSize: 20),
                              ),
                              const HorizintalSpace(23),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_sweep_outlined,
                                    size: 25,
                                  )),
                            ],
                          ),
                          const VirticalSpace(1.5),
                          Row(
                            children: [
                              AnimatedRatingBar(
          activeFillColor: Theme.of(context).colorScheme.inversePrimary,
          strokeColor: Colors.green,
          initialRating: 0,
          height: 20,
          width: 80,
          animationColor: Colors.red,
          onRatingUpdate: (rating) {
            debugPrint(rating.toString());
          },
        ),
        const HorizintalSpace(1),
                              const Text(
                                "15/4/2024",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          const VirticalSpace(1),
                           const SizedBox(
                  height: 70,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus....",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
