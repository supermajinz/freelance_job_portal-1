import 'package:equatable/equatable.dart';

class EditOfferModel extends Equatable {
  final String? message;
  final int? cost;
  final int? deliveryTime;

  const EditOfferModel({this.message, this.cost, this.deliveryTime});

  factory EditOfferModel.fromJson(Map<String, dynamic> json) {
    return EditOfferModel(
      message: json['message'] as String?,
      cost: json['cost'] as int?,
      deliveryTime: json['deliveryTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'cost': cost,
        'deliveryTime': deliveryTime,
      };

  @override
  List<Object?> get props => [message, cost, deliveryTime];
}
