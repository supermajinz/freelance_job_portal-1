import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final int? id;
  final int? senderUserId;
  final int? receiverUserId;
  final double? amount;
  final DateTime? transactionDate;
  final String? type;
  final int? transactionNumber;
  final dynamic postBalance;

  const Payment({
    this.id,
    this.senderUserId,
    this.receiverUserId,
    this.amount,
    this.transactionDate,
    this.type,
    this.transactionNumber,
    this.postBalance,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json['id'] as int?,
        senderUserId: json['senderUserId'] as int?,
        receiverUserId: json['receiverUserId'] as int?,
        amount: (json['amount'] as num?)?.toDouble(),
        transactionDate: json['transactionDate'] == null
            ? null
            : DateTime.parse(json['transactionDate'] as String),
        type: json['type'] as String?,
        transactionNumber: json['transactionNumber'] as int?,
        postBalance: json['postBalance'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderUserId': senderUserId,
        'receiverUserId': receiverUserId,
        'amount': amount,
        'transactionDate': transactionDate?.toIso8601String(),
        'type': type,
        'transactionNumber': transactionNumber,
        'postBalance': postBalance,
      };

  Payment copyWith({
    int? id,
    int? senderUserId,
    int? receiverUserId,
    double? amount,
    DateTime? transactionDate,
    String? type,
    int? transactionNumber,
    dynamic postBalance,
  }) {
    return Payment(
      id: id ?? this.id,
      senderUserId: senderUserId ?? this.senderUserId,
      receiverUserId: receiverUserId ?? this.receiverUserId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      type: type ?? this.type,
      transactionNumber: transactionNumber ?? this.transactionNumber,
      postBalance: postBalance ?? this.postBalance,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      senderUserId,
      receiverUserId,
      amount,
      transactionDate,
      type,
      transactionNumber,
      postBalance,
    ];
  }
}
