part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}
class ChatFetched extends ChatState {
  final List<Chat>
}

class ChatConnecting extends ChatState {}

class ChatConnected extends ChatState {
  const ChatConnected();
}

class ChatDisconnected extends ChatState {}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}

class ChatMessageReceived extends ChatConnected {
  final List<ChatMessage> messages;

  const ChatMessageReceived(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatMessageSent extends ChatConnected {}
