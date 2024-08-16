import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/sort_body.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/size_config.dart';

class Sort extends StatelessWidget {
  const Sort({super.key, required this.filters});
  final Map<String, dynamic> filters;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'فرز',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: SafeArea(child: SortBody(filters: filters)),
    );
  }
}
