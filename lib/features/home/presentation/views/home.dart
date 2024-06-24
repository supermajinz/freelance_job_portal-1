import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/features/home/presentation/views/widget/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColer,
        title: const Text('Home',style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
              ))
        ],
        iconTheme: const IconThemeData(
          size: 30,color: Colors.white
        ),
      ),
      body: const HomeBody(),
    );
  }
}
