import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/chat%20copy/data/message.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';
import 'package:freelance_job_portal/features/chat/data/models/message.dart';
import 'package:freelance_job_portal/features/chat/presentation/view_models/bloc/chat_bloc.dart';
import 'package:freelance_job_portal/features/chat/presentation/views/widget/custom_text_form_chat.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/utils.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../auth/data/models/user.dart';
import '../../../../auth/presentation/view_models/bloc/auth_bloc.dart';

class DmsBody extends StatefulWidget {
  final ChatRoomModel chat;

  const DmsBody({super.key, required this.chat});

  @override
  State<DmsBody> createState() => _DmsBodyState();
}

class _DmsBodyState extends State<DmsBody> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final User user;
  late final User secondUser;

  // List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    user = widget.chat.sender;
    final bloc = context.read<ChatBloc>();
    // bloc.add(ConnectToChatEvent(chatId: widget.chat.chatId));
    bloc.add(GetOldMessages(widget.chat));
    secondUser = widget.chat.recipient;
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 400));
      if(mounted){
        bloc.add(GetOldMessages(widget.chat));
      }
      return mounted;
    });
  }

  // @override
  // void didChangeDependencies() {
  //   dependOnInheritedWidgetOfExactType();
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    // context.read<ChatBloc>().add(DisconnectFromChatEvent(widget.chat));
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userName =
        '${widget.chat.recipient.firstname ?? ''} ${widget.chat.recipient.lastname ?? ''}';

    final isClient = widget.chat.recipient.role == "CLIENT";
    final isWorker = widget.chat.recipient.role == "WORKER";

    final userPhotoUrl = isClient
        ? null
        : isWorker
        ? null
        : null;
    final backgroundColor =
    userPhotoUrl == null ? Utils.getBackgroundColor(userName) : null;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back)),
              const HorizintalSpace(0),
              CircleAvatar(
                radius: SizeConfig.defaultSize! * 3,
                backgroundColor: backgroundColor?.withOpacity(.7),
                backgroundImage:
                userPhotoUrl != null ? NetworkImage(userPhotoUrl) : null,
                child: userPhotoUrl == null
                    ? Center(
                  child: Text(
                    Utils.getInitials(userName),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
                    : null,
              ),
              const HorizintalSpace(2),
              Text(
                "${secondUser.firstname} ${secondUser.lastname}",
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatMessagesFetched) {
                  final messages = state.msgs;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      print("message:$index");
                      final message = messages[index];
                      final isSender =
                          message.senderId == user.id.toString();
                      final nextIsSender = messages.length > index+1?
                          messages[index+1].senderId == user.id.toString() : !isSender;
                      return BubbleSpecialThree(
                        isSender: isSender,
                        text: message.content,
                        color: isSender
                            ? const Color(0xFF1B97F3)
                            : Colors.grey[300]!,
                        tail: nextIsSender != isSender,
                        textStyle: TextStyle(
                            color: isSender ? Colors.white : Colors.black,
                            fontSize: 16),
                      );
                    },
                  );
                } else {
                  return const CustomLoading();
                }
              },
            ),
          ),
          CustomTextFormChat(
            controller: _messageController,
            onSend: () {
              print("dknasf");
              return _sendMessage();
            },
          )
        ],
      ),
    );
  }

  _sendMessage() {
    print('26516+8152');
    print(_messageController.text);
    if (_messageController.text.isNotEmpty) {
      print('aasdasf');
      context
          .read<ChatBloc>()
          .add(SendMessageEvent(_messageController.text, widget.chat));
      _messageController.clear();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
