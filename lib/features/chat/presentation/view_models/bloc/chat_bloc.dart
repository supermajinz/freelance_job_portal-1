import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/chat/data/ChatService.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';

import '../../../data/models/chat_model.dart';
import '../../../data/models/message.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService chatService;

  ChatBloc(this.chatService) : super(ChatInitial()) {
    // on<ConnectToChatEvent>(connectToChatEvent);
    // on<DisconnectFromChatEvent>(disconnectFromChatEvent);
    on<SendMessageEvent>(sendMessageEvent);
    on<GetChats>(getChats);
    on<GetOldMessages>(getOldMessages);
    on<CreateChat>(createChat);
  }

  // FutureOr<void> connectToChatEvent(
  //     ConnectToChatEvent event, Emitter<ChatState> emit) async {
  //   emit(ChatConnecting());
  //   final result =
  //       await chatService.subscribeToChat(event.chatId, callback: (msg) {
  //     emit(ChatMessageReceived(msg));
  //   });
  // }

  void _listenToMessages(Emitter<ChatState> emit) {}

  // FutureOr<void> disconnectFromChatEvent(
  //     DisconnectFromChatEvent event, Emitter<ChatState> emit) async {
  //   final result = await chatService.unsubscribeFromChat(event.chat.chatId);
  // }

  FutureOr<void> sendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    print("bloc sendMessage");
    // final result = await chatService.sendMessage(event.message, event.chat);
    final messagePayload = {
      'senderId': event.chat.sender.id,
      'recipientId': event.chat.recipient.id,
      'content': event.message,
    };
    await DependencyInjection.provideApiService().post("/chatRoom/message", messagePayload);
    emit(const ChatMessageSent());
  }

  Future<FutureOr<void>> getChats(
      GetChats event, Emitter<ChatState> emit) async {
    final result =
        await DependencyInjection.provideChatRepo().getRooms(event.userId);
    result.fold((l) => emit(const ChatError("خطأ في الحصول على المحادثات")),
        (r) => emit(ChatFetched(r)));
  }

  Future<FutureOr<void>> getOldMessages(GetOldMessages event, Emitter<ChatState> emit) async {
    final result =
        await DependencyInjection.provideChatRepo().getOldChatMessages(event.chat);
    result.fold((l) => emit(const ChatError("خطأ في الحصول على الرسائل")),
            (r) => emit(ChatMessagesFetched(r)));
  }

  Future<FutureOr<void>> createChat(CreateChat event, Emitter<ChatState> emit) async {
    final result =
        await DependencyInjection.provideChatRepo().createChat(event.userId);
    result.fold((l) => emit(const ChatError("خطأ في  المحادثات")),
            (r) => emit(ChatCreated(r)));
  }
}