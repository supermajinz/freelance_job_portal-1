part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatConnecting extends ChatState {}

class ChatConnected extends ChatState {}

class ChatDisconnected extends ChatState {}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}

class ChatMessageReceived extends ChatState {
  final List<ChatMessage> messages;

  const ChatMessageReceived(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatMessageSent extends ChatState {}
