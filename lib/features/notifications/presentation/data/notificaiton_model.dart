import 'dart:convert';

class NotificationModel{
  final String title;
  final String description;
  final DateTime date;
  final bool read;

  const NotificationModel({
    required this.title,
    required this.description,
    required this.date,
    required this.read,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date.toString(),
      'read': read,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date']),
      read: map['read'] as bool? ?? false,
    );
  }

  toJson()=>json.encode(toMap());
  factory NotificationModel.fromJson(String string)=> NotificationModel.fromMap(json.decode(string));
}