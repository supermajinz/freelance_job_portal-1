import 'worker.dart';

class OffersModel {
  final int? id;
  String? message;
  int? cost;
  int? deliveryTime;
  final String? status;
  final DateTime? createDate;
  final Worker? worker;

  OffersModel({
    this.id,
    this.message,
    this.cost,
    this.deliveryTime,
    this.status,
    this.createDate,
    this.worker,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        id: json['id'] as int?,
        message: json['message'] as String?,
        cost: json['cost'] as int?,
        deliveryTime: json['deliveryTime'] as int?,
        status: json['status'] as String?,
        createDate: json['createDate'] == null
            ? null
            : DateTime.parse(json['createDate'] as String),
        worker: json['worker'] == null
            ? null
            : Worker.fromJson(json['worker'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'cost': cost,
        'deliveryTime': deliveryTime,
        'status': status,
        'createDate': createDate?.toIso8601String(),
        'worker': worker?.toJson(),
      };

  @override
  bool operator ==(covariant OffersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.message == message &&
        other.cost == cost &&
        other.deliveryTime == deliveryTime &&
        other.status == status &&
        other.createDate == createDate &&
        other.worker == worker;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        cost.hashCode ^
        deliveryTime.hashCode ^
        status.hashCode ^
        createDate.hashCode ^
        worker.hashCode;
  }
}
