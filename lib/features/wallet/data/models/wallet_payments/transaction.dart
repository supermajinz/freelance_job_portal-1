import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int? id;
  final int? senderUserId;
  final int? receiverUserId;
  final double? amount;
  final DateTime? transactionDate;
  final String? type;
  final int? transactionNumber;
  final dynamic postBalance;

  const Transaction({
    this.id,
    this.senderUserId,
    this.receiverUserId,
    this.amount,
    this.transactionDate,
    this.type,
    this.transactionNumber,
    this.postBalance,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
