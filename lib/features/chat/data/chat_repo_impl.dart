import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
//import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatRepoImpl implements ChatRepo {
  //final ApiService _apiService;
  late StompClient stompClient;
  final _messageController = StreamController<ChatMessage>.broadcast();

  @override
  Future<Either<Failure, void>> connect(String url) async {
    try {
      stompClient = StompClient(
        config: StompConfig(
          url: url,
          onConnect: onConnect,
          onWebSocketError: (dynamic error) => print(error.toString()),
        ),
      );
      stompClient.activate();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
  // @override
  // Future<Either<Failure, void>> disconnect() async {
  //   try {
  //     _socket.disconnect();
  //     await _messageController.close();
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  @override
  Stream<ChatMessage> get messages => _messageController.stream;

  // @override
  // Future<Either<Failure, void>> sendMessage(String message) async {
  //   try {
  //     _socket.emit('message', message);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  void onConnect(StompFrame p1) {}

  @override
  Future<Either<Failure, void>> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> sendMessage(String message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
