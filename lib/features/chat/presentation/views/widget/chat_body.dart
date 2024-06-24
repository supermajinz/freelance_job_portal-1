import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_search.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_message_card.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 55,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 710,
              color: const Color.fromARGB(255, 182, 232, 238),
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const CustomMessageCard();
                  },
                ),
              ),
            )),
        const Positioned(
            bottom: 675,
            right: 10,
            left: 10,
            child: CustomSearch(title: "Hinted search text"))
      ],
    );
  }
}
