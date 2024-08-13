import 'package:equatable/equatable.dart';

import 'transaction.dart';
import 'wallet.dart';

class WalletPayments extends Equatable {
  final Wallet? wallet;
  final List<Transaction>? transactions;

  const WalletPayments({this.wallet, this.transactions});

  factory WalletPayments.fromJson(Map<String, dynamic> json) {
    return WalletPayments(
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'wallet': wallet?.toJson(),
        'transactions': transactions?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [wallet, transactions];
}
