import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/withdraw_body.dart';
import 'package:go_router/go_router.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTitle(
            text: 'Withdraw',
            white: true,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: CustomIconBack(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: const SafeArea(child: WithdrawBody()),
    );
  }
}
