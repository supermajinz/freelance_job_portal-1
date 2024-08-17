part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}
class ChatFetched extends ChatState {
  final List<ChatRoomModel> rooms;

  const ChatFetched(this.rooms);

  @override
  List<Object> get props => [rooms];
}
class ChatMessagesFetched extends ChatState {
  final List<MessageModel> msgs;

  const ChatMessagesFetched(this.msgs);

  @override
  List<Object> get props => [msgs];
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
  final MessageModel message;

  const ChatMessageReceived(this.message);

  @override
  List<Object> get props => [message];
}

class ChatMessageSent extends ChatConnected {
  const ChatMessageSent();

  @override
  List<Object> get props => [];
}
class ChatCreated extends ChatConnected {
  final ChatRoomModel room;

  const ChatCreated(this.room);

  @override
  List<Object> get props => [room];
}
