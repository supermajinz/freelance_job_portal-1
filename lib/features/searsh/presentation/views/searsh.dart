import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/searsh_body.dart';

class Searsh extends StatelessWidget {
  const Searsh({super.key, required this.filters});
  final Map<String, dynamic> filters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SearshBody(filters: filters)),
    );
  }
}
