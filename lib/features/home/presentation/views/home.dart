import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/home/presentation/views/drawar_view.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/buttom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
     // bottomNavigationBar: ButtomNavigationBar(),
      body: DrawarView(),
    );
  }
}
