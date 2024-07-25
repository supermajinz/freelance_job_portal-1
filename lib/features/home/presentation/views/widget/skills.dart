import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_icon_back.dart';
import '../../../../../core/widget/custom_title.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const CustomTitle(
              text: 'المهارات',
              white: true,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: CustomIconBack(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1,
              vertical: SizeConfig.defaultSize! * 2),
          child: const ShowChip(),
        ));
  }
}
