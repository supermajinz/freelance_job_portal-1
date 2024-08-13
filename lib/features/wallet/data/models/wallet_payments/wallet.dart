import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final int? id;
  final double? totalBalance;
  final double? totalHeldBalance;

  const Wallet({this.id, this.totalBalance, this.totalHeldBalance});

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json['id'] as int?,
        totalBalance: json['totalBalance'] as double?,
        totalHeldBalance: json['totalHeldBalance'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'totalBalance': totalBalance,
        'totalHeldBalance': totalHeldBalance,
      };

  @override
  List<Object?> get props => [id, totalBalance, totalHeldBalance];
}
