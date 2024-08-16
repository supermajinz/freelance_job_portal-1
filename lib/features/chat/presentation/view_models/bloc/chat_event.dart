// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ConnectToChatEvent extends ChatEvent {
  final String chatId;
  const ConnectToChatEvent({
    required this.chatId,
  });
}

class DisconnectFromChatEvent extends ChatEvent {
  final ChatRoomModel chat;

  const DisconnectFromChatEvent(this.chat);

}

class SendMessageEvent extends ChatEvent {
  final String message;
  final ChatRoomModel chat;

  const SendMessageEvent(this.message, this.chat);

  @override
  List<Object> get props => [message, chat];
}

class GetChats extends ChatEvent {
  final int userId;
  const GetChats(this.userId);

  @override
  List<Object> get props => [userId];
}

class GetOldMessages extends ChatEvent {
  final ChatRoomModel chat;
  const GetOldMessages(this.chat);

  @override
  List<Object> get props => [chat];
}
