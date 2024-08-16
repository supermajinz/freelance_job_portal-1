part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class GetWalletEvent extends WalletEvent {
  final int userId;

  const GetWalletEvent(this.userId);
}

class GetTransactionHistory extends WalletEvent {
  final int userId;

  const GetTransactionHistory(this.userId);
}

class GetWalletPayments extends WalletEvent {
  final int userId;

  const GetWalletPayments(this.userId);
}
