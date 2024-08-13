// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/wallet/data/models/payment.dart';

import 'package:freelance_job_portal/features/wallet/data/models/wallet_model.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_payments/wallet_payments.dart';
import 'package:freelance_job_portal/features/wallet/data/repo/payments_repo.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final PaymentsRepo paymentsRepo;
  WalletBloc(
    this.paymentsRepo,
  ) : super(WalletInitial()) {
    on<GetWalletEvent>(_getWalletEvent);
    on<GetTransactionHistory>(_getTrasnactionHistory);
    on<GetWalletPayments>(_getWalletPayment);
  }

  FutureOr<void> _getWalletEvent(
      GetWalletEvent event, Emitter<WalletState> emit) async {
    final result = await paymentsRepo.getWalletbyUser(event.userId);
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (wallet) => emit(WalletLoaded(wallet)));
  }

  FutureOr<void> _getTrasnactionHistory(
      GetTransactionHistory event, Emitter<WalletState> emit) async {
    final result = await paymentsRepo.getTrasnsactionHistory(event.userId);
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (payments) => emit(TransactionHistoryLoaded(payments)));
  }

  FutureOr<void> _getWalletPayment(
      GetWalletPayments event, Emitter<WalletState> emit) async {
    final result = await paymentsRepo.getWalletPayments(event.userId);
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (wallet) => emit(WalletPaymentsLoaded(wallet)));
  }
}
