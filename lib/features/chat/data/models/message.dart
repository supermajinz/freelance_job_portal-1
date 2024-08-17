class MessageModel {
  final String id;
  final String senderId;
  final String recipientId;
  final String senderName;
  final String recipientName;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.senderName,
    required this.recipientName,
    required this.content,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      senderName: json['senderName'] as String? ??"",
      recipientName: json['recipientName'] as String? ??"",
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'recipientId': recipientId,
      'senderName': senderName,
      'recipientName': recipientName,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
