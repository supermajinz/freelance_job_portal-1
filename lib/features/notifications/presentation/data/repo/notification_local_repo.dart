import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/notifications/presentation/data/notificaiton_model.dart';

abstract class NotificationLocalRepo {
  Either<Failure, List<NotificationModel>> getMessages();
  Either<Failure, bool> addMessage(NotificationModel notification);
  Either<Failure, bool> removeMessage(int index);

  Either<Failure, bool> markAsRead();
}