import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/saved/presentation/views/widget/saved_body.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SavedBody()),
    );
  }
}
