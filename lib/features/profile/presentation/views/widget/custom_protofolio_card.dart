import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:go_router/go_router.dart';

class CustomProtofolioCard extends StatelessWidget {
  const CustomProtofolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SizeConfig.defaultSize! * 2,
      runSpacing: SizeConfig.defaultSize! * 2,
      children: List.generate(4, (index) {
        if (index == 3) {
          return InkWell(
            onTap: () {},
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/pro.jpg"),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: SizeConfig.defaultSize! * 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
                    ),
                    child: const Center(
                      child: CustomSubTitleMedium(
                        text: "+7 More",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: SizeConfig.defaultSize! * 3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(SizeConfig.defaultSize! * 1.5),
                        bottomRight:
                            Radius.circular(SizeConfig.defaultSize! * 1.5),
                      ),
                    ),
                    child: const CustomLabel(
                      text: "Black Hold design",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return InkWell(
          onTap: () {
            GoRouter.of(context).push("/showprotodetails");
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: MediaQuery.of(context).size.width / 2 - 20,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pro.jpg"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: SizeConfig.defaultSize! * 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: SizeConfig.defaultSize! * 3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(SizeConfig.defaultSize! * 1.5),
                      bottomRight:
                          Radius.circular(SizeConfig.defaultSize! * 1.5),
                    ),
                  ),
                  child: const CustomLabel(
                    text: "Black Hold design",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
