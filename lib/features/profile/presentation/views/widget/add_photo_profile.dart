import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class AddPhotoProfile extends StatelessWidget {
  const AddPhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 240, 225, 180),
        maxRadius: SizeConfig.defaultSize! * 8,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo_outlined,
              size: SizeConfig.defaultSize! * 6,
            )),
      ),
    );
  }
}
