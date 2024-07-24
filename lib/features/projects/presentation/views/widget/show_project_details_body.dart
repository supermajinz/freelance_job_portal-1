import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_chip_project.dart';
import 'package:freelance_job_portal/features/offers/presentation/views/widget/custom_offer.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_container.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_meony.dart';
import '../../../../../core/widget/custom_sub_title.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';

class ShowProjectDetailsBody extends StatefulWidget {
  const ShowProjectDetailsBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShowProjectDetailsBodyState createState() => _ShowProjectDetailsBodyState();
}

class _ShowProjectDetailsBodyState extends State<ShowProjectDetailsBody> {
  bool showOffers = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleOffers() {
    setState(() {
      showOffers = !showOffers;
    });
    if (showOffers) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const VirticalSpace(3),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * .5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                      topRight: Radius.circular(SizeConfig.defaultSize! * 4),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VirticalSpace(15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.laptop),
                            CustomSubTitle(text: "Order Management App"),
                            Column(
                              children: [
                                CustomLabel(
                                  text: "1d",
                                  color: Colors.black,
                                ),
                                CustomLabel(
                                  text: "Active",
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                        const VirticalSpace(2),
                        const CustomSubTitleMedium(text: "Description:"),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.defaultSize! * .5,
                          ),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus",
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const VirticalSpace(.5),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "show more",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decorationThickness: 2,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        const VirticalSpace(4),
                        const Row(
                          children: [
                            Expanded(
                                child: CustomSubTitleMedium(text: "Price:")),
                            Expanded(
                              child: CustomMeony(
                                text: "7,500,000",
                              ),
                            ),
                          ],
                        ),
                        const VirticalSpace(3),
                        const Row(
                          children: [
                            Expanded(
                                child: CustomSubTitleMedium(
                                    text: "Delivery Time:")),
                            Expanded(
                              child: CustomContainer(
                                text: "12/4/2024",
                              ),
                            ),
                          ],
                        ),
                        const VirticalSpace(3),
                        const CustomSubTitleMedium(text: "Skills Required:"),
                        const VirticalSpace(1),
                        const CustomChipProject(),
                        const VirticalSpace(5),
                        InkWell(
                          onTap: () {
                            _toggleOffers();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.defaultSize! * 3,
                            width: SizeConfig.defaultSize! * 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.defaultSize! * 2)),
                            child: const CustomBody(
                              text: "Offers: 2",
                            ),
                          ),
                        ),
                        const VirticalSpace(2),
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 800),
                          firstChild: Container(),
                          secondChild: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push("/offerdetails");
                                    },
                                    child: const CustomOffer());
                              },
                              separatorBuilder: (context, index) {
                                return const VirticalSpace(1);
                              },
                              itemCount: 2),
                          crossFadeState: showOffers
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                        const VirticalSpace(2),
                        Center(
                          child: CustomButtonGeneral(
                            onPressed: () {},
                            color: Colors.white,
                            textcolor: Colors.black,
                            text: "Apply",
                            borderSide: BorderSide(
                                width: SizeConfig.defaultSize! * .1,
                                color: Colors.grey),
                            width: SizeConfig.defaultSize! * 20,
                          ),
                        ),
                        const VirticalSpace(2),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * .5),
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
                        topRight: Radius.circular(SizeConfig.defaultSize! * 4),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.defaultSize! * .5),
                              child: CircleAvatar(
                                radius: SizeConfig.defaultSize! * 5,
                                backgroundImage: const AssetImage(
                                  "assets/images/pro.jpg",
                                ),
                              ),
                            ),
                            const HorizintalSpace(.5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomSubTitleMedium(
                                  text: "أحمد مراد",
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.defaultSize! * .5),
                                  child: const CustomBody(
                                    text: "مطور تطبيقات موبايل",
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.defaultSize! * .5),
                                  child: const CustomBody(
                                    text: "13 مشروع مكتمل",
                                    color: Colors.white,
                                  ),
                                ),
                                const VirticalSpace(0.2),
                                const Row(
                                  children: [
                                    CustomLabel(
                                      text: "4.6",
                                      color: Colors.white,
                                    ),
                                    HorizintalSpace(0.5),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
