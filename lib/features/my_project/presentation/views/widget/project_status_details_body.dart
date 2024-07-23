import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_body_status_details.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_info_details_status.dart';
import 'package:freelance_job_portal/features/my_project/presentation/views/widget/custom_timeline.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_offer.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_body_medium.dart';
import '../../../../../core/widget/custom_button_general.dart';
import '../../../../../core/widget/custom_label.dart';
import '../../../../../core/widget/custom_sub_title.dart';

class ProjectStatusDetailsBody extends StatefulWidget {
  const ProjectStatusDetailsBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShowProjectDetailsBodyState createState() => _ShowProjectDetailsBodyState();
}

class _ShowProjectDetailsBodyState extends State<ProjectStatusDetailsBody>
    with SingleTickerProviderStateMixin {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VirticalSpace(15),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize! * 2),
                        child: const Row(
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
                      ),
                      const VirticalSpace(2),
                      const CustomBodyStatusDetails(),
                      const CustomTimeline(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize! * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VirticalSpace(5),
                            InkWell(
                              onTap: _toggleOffers,
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
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: showOffers ? null : 0,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: showOffers ? 1.0 : 0.0,
                                child: showOffers
                                    ? ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              GoRouter.of(context)
                                                  .push("/offerdetails");
                                            },
                                            child: const CustomOffer(),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const VirticalSpace(1);
                                        },
                                        itemCount: 2,
                                      )
                                    : const SizedBox.shrink(),
                              ),
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
                    ],
                  ),
                ),
                const CustomInfoDetailsStatus()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
