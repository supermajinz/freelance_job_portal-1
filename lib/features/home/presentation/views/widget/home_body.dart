import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/presentation/view_models/home_bloc/home_bloc.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/custom_cartegory_card.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 1),
      child: ListView(
        shrinkWrap: true,
        children: [
          const VirticalSpace(2),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 0.5,
                  right: SizeConfig.defaultSize! * 1),
              child: const CustomSubTitle(
                text: "التصنيفات",
              )),
          const VirticalSpace(2),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SizedBox(
                  height: SizeConfig.defaultSize! * 29,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.1,
                            crossAxisSpacing: 1),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return InkWell(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .homeRepo
                                .fetchSkillsByCategory(category.id!);
                            GoRouter.of(context)
                                .push("/skills", extra: category.id);
                          },
                          child: CustomCartegoryCard(
                              cat: state.categories[index]));
                    },
                  ),
                );
              } else if (state is HomeFailure) {
                return Text(state.errMessage);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          const VirticalSpace(1),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 1,
                  right: SizeConfig.defaultSize! * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomSubTitle(
                    text: "المقترحات",
                  ),
                  InkWell(
                      onTap: () {},
                      child: const CustomLabel(
                        text: "إظهار الكل",
                        color: Colors.blueAccent,
                      ))
                ],
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 29,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/showprojectdetails');
                    },
                    child: const CustomProjectCard());
              },
            ),
          ),
          const VirticalSpace(4),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 1,
                  right: SizeConfig.defaultSize! * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomSubTitle(
                    text: "الأكثر شيوعا",
                  ),
                  InkWell(
                      onTap: () {},
                      child: const CustomLabel(
                        text: "إظهار الكل",
                        color: Colors.blueAccent,
                      ))
                ],
              )),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 29,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/showprojectdetails');
                    },
                    child: const CustomProjectCard());
              },
            ),
          ),
          const VirticalSpace(1),
        ],
      ),
    );
  }
}
