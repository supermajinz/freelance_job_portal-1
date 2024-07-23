import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/searsh_body.dart';


class Searsh extends StatelessWidget {
  const Searsh({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child:SearshBody() ),
    );
  }
}
