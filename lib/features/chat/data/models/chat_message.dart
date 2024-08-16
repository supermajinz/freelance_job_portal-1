// lib/features/chat/domain/models/chat_message.dart
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String recipientId;
  final bool isSender;
  final String content;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.recipientId,
    this.isSender = false,
    required this.content,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      recipientId: json['recipientId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  @override
  List<Object?> get props =>
      [id, senderId, recipientId, isSender, content, timestamp];
}
