import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/wallet/data/models/payment.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_model.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_payments/wallet_payments.dart';
import 'package:freelance_job_portal/features/wallet/data/repo/payments_repo.dart';

class PaymentsRepoImpl extends PaymentsRepo {
  final ApiService _apiService;

  PaymentsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, WalletModel>> getWalletbyUser(int userId) async {
    try {
      final response = await _apiService.get('wallets/$userId');
      return Right(WalletModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Payment>>> getTrasnsactionHistory(
      int userId) async {
    try {
      final response = await _apiService.get('transactions/receiver/$userId');
      final secondResponse =
          await _apiService.get('transactions/sender/$userId');

      List<Payment> receiver = [];
      if (response['data'] is List) {
        final receiverPayments = response['data'] as List;
        receiver =
            receiverPayments.map((pay) => Payment.fromJson(pay)).toList();
      }

      List<Payment> sender = [];
      if (secondResponse['data'] is List) {
        final senderPayments = secondResponse['data'] as List;
        sender = senderPayments.map((pay) => Payment.fromJson(pay)).toList();
      }

      // Combine sender and receiver lists
      final List<Payment> allTransactions = [...receiver, ...sender];

      // Sort the combined list by transaction date (assuming Payment has a dateTime property)
      allTransactions
          .sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));

      return right(allTransactions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WalletPayments>> getWalletPayments(int userId) async{
   try{
    final response = await _apiService.get('wallets/with_transactions/$userId');
    return Right(WalletPayments.fromJson(response));
   } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
