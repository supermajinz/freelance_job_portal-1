part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletError extends WalletState {
  final String errorMessage;

  const WalletError(this.errorMessage);
   @override
  List<Object> get props => [errorMessage];
}

class WalletLoaded extends WalletState {
  final WalletModel wallet;

  const WalletLoaded(this.wallet);
}

class TransactionHistoryLoaded extends WalletState {
  final List<Payment> transactionHistory;

  const TransactionHistoryLoaded(this.transactionHistory);
}

class WalletPaymentsLoaded extends WalletState {
  final WalletPayments walletPayments;

  WalletPaymentsLoaded(this.walletPayments);
}
