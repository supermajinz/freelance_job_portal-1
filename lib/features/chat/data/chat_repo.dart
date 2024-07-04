import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, void>> connect(String url);
  Future<Either<Failure, void>> disconnect();
  Future<Either<Failure, void>> sendMessage(String message);
  Stream<ChatMessage> get messages;
}
