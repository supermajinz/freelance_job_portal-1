import 'package:dartz/dartz.dart';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_message.dart';
import 'package:freelance_job_portal/features/chat/data/models/message.dart';

import '../../../core/utils/api_service.dart';
import 'models/chat_model.dart';

class ChatRepo {
  final ApiService apiService;

  ChatRepo(this.apiService);

  Future<Either<Failure, List<ChatRoomModel>>> getRooms(int id) async {
    try{
      final res = await apiService.get("/chatRoom/$id");
      print(res);
      return right(res['data'].map<ChatRoomModel>((e) => ChatRoomModel.fromMap(e)).toList());
    }catch(e){
      print(e);
      return left(ServerFailure(errMessage: "Error getting chat rooms"));
    }
  }

  Future<Either<Failure, List<MessageModel>>> getOldChatMessages(ChatRoomModel room) async{
    try{
      final res = await apiService.get("/chatRoom/messages/${room.sender.id}/${room.recipient.id}");
      print(res);
      return right(res['data'].map<MessageModel>((e) => MessageModel.fromJson(e)).toList());
    }catch(e){
      if(e is TypeError){
        print(e.stackTrace);
      }
      return left(ServerFailure(errMessage: "Error getting chat rooms"));
    }
  }

  Future<Either<Failure, ChatRoomModel>> createChat(int userId) async {
    try{
      final res = await apiService.post("/chatRoom/$userId", {});
      return right(ChatRoomModel.fromMap(res));
    }catch(e){
      return left(ServerFailure(errMessage: "خطأ في إنشاء المحادثة"));
    }
  }
}

