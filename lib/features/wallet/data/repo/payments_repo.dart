import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/wallet/data/models/payment.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_model.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_payments/wallet_payments.dart';

abstract class PaymentsRepo {
  Future<Either<Failure, WalletModel>> getWalletbyUser(int userId);
  Future<Either<Failure, List<Payment>>> getTrasnsactionHistory(int userId);

  Future<Either<Failure, WalletPayments>> getWalletPayments(int userId);
}
