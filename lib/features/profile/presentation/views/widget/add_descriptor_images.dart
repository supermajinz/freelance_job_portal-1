import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class AddDescriptorImages extends StatelessWidget {
  const AddDescriptorImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 202, 202),
            ),
            height: SizeConfig.defaultSize! * 17,
            width: SizeConfig.defaultSize! * 13,
            child: const Placeholder(
              strokeWidth: 1,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: SizeConfig.defaultSize! * 1.5,
          top: SizeConfig.defaultSize! * 1.5,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 202, 202),
            ),
            height: SizeConfig.defaultSize! * 17,
            width: SizeConfig.defaultSize! * 13,
            child: const Placeholder(
              strokeWidth: 1,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: SizeConfig.defaultSize! * 3,
          top: SizeConfig.defaultSize! * 3,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 202, 202),
            ),
            height: SizeConfig.defaultSize! * 17,
            width: SizeConfig.defaultSize! * 13,
            child: Placeholder(
              strokeWidth: 1,
              color: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    size: SizeConfig.defaultSize! * 4,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
