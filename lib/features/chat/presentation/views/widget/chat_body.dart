import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_search.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_message_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';
import '../../view_models/bloc/chat_bloc.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  void initState() {
    final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
    context.read<ChatBloc>().add(GetChats(userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController chatController = TextEditingController();
    return Column(
      children: [
        const VirticalSpace(1),
        CustomSearch(title: "Hinted search text", myController: chatController),
        Container(
          color: Theme
              .of(context)
              .cardColor,
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if(state is ChatError){
                return const Center(
                  child: CustomSubTitle(text: "حدث خطأ"),
                );
              }
              if(state is! ChatFetched){
                return const Center();
              }
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 2),
                      child: const Divider());
                },
                shrinkWrap: true,
                itemCount: state.rooms.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        GoRouter.of(context).push("/dms", extra: state.rooms[index]);
                      },
                      child: CustomMessageCard(room: state.rooms[index]));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
