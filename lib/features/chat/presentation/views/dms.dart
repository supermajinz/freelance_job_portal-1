import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/dms_body.dart';

class DMs extends StatelessWidget {
  const DMs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DmsBody(
        chatUrl: '',
      ),
    );
  }
}
