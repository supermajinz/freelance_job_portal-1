import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/notifications/presentation/data/notificaiton_model.dart';

import '../../../../../core/utils/api_service.dart';
import 'notification_local_repo.dart';


class NotificationLocalRepoImpl implements NotificationLocalRepo {
  const NotificationLocalRepoImpl();

  static NotificationLocalRepo? _notificationLocalRepo;

  @override
  Either<Failure, bool> addMessage(NotificationModel notification){
    try {
      print("add message");
      final oldList = DependencyInjection.provideSharedPreferences()
          .getStringList("notifications") ?? [];
      DependencyInjection.provideSharedPreferences().setStringList(
          "notifications", [...oldList, notification.toJson()]);
      return right(true);
    }catch(e) {
      print("message error $e");
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  @override
  Either<Failure, bool> removeMessage(int index){
    try {
      final oldList = DependencyInjection.provideSharedPreferences()
          .getStringList("notifications") ?? [];
      oldList.removeAt(index);
      DependencyInjection.provideSharedPreferences().setStringList(
          "notifications", oldList);
      return right(true);
    }catch(e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Either<Failure, List<NotificationModel>> getMessages() {
    final oldList = DependencyInjection.provideSharedPreferences()
        .getStringList("notifications") ?? [];
    return right(oldList.map<NotificationModel>((e) => NotificationModel.fromJson(e)).toList());
  }

  @override
  Either<Failure, bool> markAsRead() {
    try{
      final oldList = DependencyInjection.provideSharedPreferences()
          .getStringList("notifications") ??[];
      final newList = oldList.map((e) {
        final map = json.decode(e);
        map["read"] = true;
        return json.encode(map);
      }).toList();
      DependencyInjection.provideSharedPreferences().setStringList("notifications", newList);
      return right(true);
      return right(true);
    }catch(e){
      return left(ServerFailure(errMessage: "error marking as read"));
    }
  }
}
