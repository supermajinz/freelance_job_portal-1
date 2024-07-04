import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';
//import 'package:get/get_connect/http/src/utils/utils.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo _chatRepo;
  List<ChatMessage> _messages = [];
  ChatBloc(this._chatRepo) : super(ChatInitial()) {
    on<ConnectToChatEvent>(connectToChatEvent);
    on<DisconnectFromChatEvent>(disconnectFromChatEvent);
    on<SendMessageEvent>(sendMessageEvent);
  }

  FutureOr<void> connectToChatEvent(
      ConnectToChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatConnecting());
    final result = await _chatRepo.connect(event.chatUrl);
    result.fold((failure) => emit(ChatError(failure.errMessage)), (_) {
      emit(ChatConnected());
      _listenToMessages(emit);
    });
  }

  void _listenToMessages(Emitter<ChatState> emit) {
    _chatRepo.messages.listen((message) {
      _messages.add(message);
      emit(ChatMessageReceived(List.from(_messages)));
    });
  }

  FutureOr<void> disconnectFromChatEvent(
      DisconnectFromChatEvent event, Emitter<ChatState> emit) async {
    final result = await _chatRepo.disconnect();
    result.fold((failure) => emit(ChatError(failure.errMessage)), (_) {
      emit(ChatDisconnected());
    });
  }

  FutureOr<void> sendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final result = await _chatRepo.sendMessage(event.message);
    result.fold((failure) => emit(ChatError(failure.errMessage)), (_) {
      emit(ChatMessageSent());
    });
  }
}
