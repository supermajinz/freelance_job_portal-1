import 'package:equatable/equatable.dart';

import 'worker.dart';

class OfferModel extends Equatable {
  final int? id;
  final String? message;
  final int? cost;
  final int? deliveryTime;
  final String? status;
  final DateTime? createDate;
  final Worker? worker;

  const OfferModel({
    this.id,
    this.message,
    this.cost,
    this.deliveryTime,
    this.status,
    this.createDate,
    this.worker,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
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
  List<Object?> get props {
    return [
      id,
      message,
      cost,
      deliveryTime,
      status,
      createDate,
      worker,
    ];
  }
}
