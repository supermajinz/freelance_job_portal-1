import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/chat%20copy/data/message.dart';


class DmsBodyCopy extends StatelessWidget {
  const DmsBodyCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              const VirticalSpace(2),
              Container(
                height:SizeConfig.defaultSize!*7,
                decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    CircleAvatar(
                      radius: SizeConfig.defaultSize!*3,
                      backgroundImage: const AssetImage(
                        "assets/images/pro.jpg",
                      ),
                    ),
                    const HorizintalSpace(1),
                    const Text(
                      "Xabi Alonso",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) {
                return BubbleSpecialThree(
                  isSender: false,
                  text: chat[index].toString(),
                  color: const Color(0xFF1B97F3),
                  tail: true,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                );
              },
            ),
          ),
         // const CustomTextFormChat()
        ],
      ),
    );
  }
}
