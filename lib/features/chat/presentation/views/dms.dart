import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/dms_body.dart';

class DMs extends StatelessWidget {
  const DMs({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: DmsBody(),
    );
  }
}
