import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/buttom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
              ))
        ],
        iconTheme: const IconThemeData(
          size: 30,
        ),
      ),
      drawer: const Drawer(),
      body: const SafeArea(
          child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
                left: 0, right: 0, bottom: 0, child: ButtomNavigationBar())
          ],
        ),
      )),
    );
  }
}
