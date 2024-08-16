import '../../../auth/data/models/user.dart';

class ChatRoomModel{
  final String id;
  final String chatId;
  final User sender;
  final User recipient;

  const ChatRoomModel({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.recipient,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatId': chatId,
      'sender': sender,
      'recipient': recipient,
    };
  }

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      id: map['id'] as String,
      chatId: map['chatId'] as String,
      sender: User.fromJson(map['sender']),
      recipient: User.fromJson(map['recipient']),
    );
  }
}