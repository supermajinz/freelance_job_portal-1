import 'package:equatable/equatable.dart';

class ReportModel extends Equatable {
  final int? id;
  final String? massage;
  final int? senderId;
  final int? recipientId;

  const ReportModel({
    this.id,
    this.massage,
    this.senderId,
    this.recipientId,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json['id'] as int?,
        massage: json['massage'] as String?,
        senderId: json['senderId'] as int?,
        recipientId: json['recipientId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'massage': massage,
        'senderId': senderId,
        'recipientId': recipientId,
      };

  @override
  List<Object?> get props => [id, massage, senderId, recipientId];
}
