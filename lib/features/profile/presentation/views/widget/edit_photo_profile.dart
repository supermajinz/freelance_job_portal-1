import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class EditPhotoProfile extends StatelessWidget {
  const EditPhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: const AssetImage("assets/images/pro.jpg"),
        maxRadius: SizeConfig.defaultSize! * 8,
      ),
    );
  }
}
