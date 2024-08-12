import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/args/review_args.dart';
import 'package:freelance_job_portal/features/review/presentation/views/widget/review_body.dart';
import 'package:go_router/go_router.dart';

class Review extends StatelessWidget {
  const Review({super.key, required this.args});
  final ReviewArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: SafeArea(child: ReviewBody(args: args)),
    );
  }
}
