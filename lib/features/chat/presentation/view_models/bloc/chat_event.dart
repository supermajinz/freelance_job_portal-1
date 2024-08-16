// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ConnectToChatEvent extends ChatEvent {
  final String chatUrl;
  const ConnectToChatEvent({
    required this.chatUrl,
  });
}

class DisconnectFromChatEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class GetChats extends ChatEvent {

  const GetChats();

  @override
  List<Object> get props => [];
}
