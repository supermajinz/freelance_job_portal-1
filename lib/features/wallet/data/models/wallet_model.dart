import 'package:equatable/equatable.dart';

class WalletModel extends Equatable {
  final int? id;
  final double? totalBalance;
  final double? totalHeldBalance;

  const WalletModel({this.id, this.totalBalance, this.totalHeldBalance});

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json['id'] as int?,
        totalBalance: json['totalBalance'] as double?,
        totalHeldBalance: json['totalHeldBalance'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'totalBalance': totalBalance,
        'totalHeldBalance': totalHeldBalance,
      };

  WalletModel copyWith({
    int? id,
    double? totalBalance,
    double? totalHeldBalance,
  }) {
    return WalletModel(
      id: id ?? this.id,
      totalBalance: totalBalance ?? this.totalBalance,
      totalHeldBalance: totalHeldBalance ?? this.totalHeldBalance,
    );
  }

  @override
  List<Object?> get props => [id, totalBalance, totalHeldBalance];
}
