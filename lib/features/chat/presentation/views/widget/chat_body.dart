import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_search.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_message_card.dart';
import 'package:go_router/go_router.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController chatController = TextEditingController();
    return ListView(
      shrinkWrap: true,
      children: [
        const VirticalSpace(1),
        CustomSearch(title: "Hinted search text", myController: chatController),
        Container(
          height: SizeConfig.defaultSize! * 61,
          color: Theme.of(context).cardColor,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 2),
                  child: const Divider());
            },
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    GoRouter.of(context).push("/dms");
                  },
                  child: const CustomMessageCard());
            },
          ),
        ),
      ],
    );
  }
}
