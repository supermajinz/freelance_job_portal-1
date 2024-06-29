import 'package:flutter/material.dart';

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
            height: 170,
            width: 130,
            child: const Placeholder(
              strokeWidth: 1,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 15,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 202, 202),
            ),
            height: 170,
            width: 130,
            child: const Placeholder(
              strokeWidth: 1,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 30,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 202, 202),
            ),
            height: 170,
            width: 130,
            child: Placeholder(
              strokeWidth: 1,
              color: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 40,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
