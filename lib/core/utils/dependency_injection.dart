import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo_impl.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';
import 'package:freelance_job_portal/features/chat/data/ChatService.dart';

class DependencyInjection {
  static AuthTokenService provideAuthTokenService() {
    return AuthTokenService();
  }

  static ApiService provideApiService() {
    final authTokenService = provideAuthTokenService();
    return ApiService(
      baseUrl: 'http://localhost:8080/api/v1/',
      authTokenService: authTokenService,
    );
  }
  static AuthRepo provideAuthRepo() {
    final apiService = provideApiService();
    final authTokenService = provideAuthTokenService();
    return AuthRepoImpl(apiService, authTokenService);
  }
//    ChatRepo provideChatRepo(String chatUrl) {
//     return ChatRepoImpl(chatUrl);
//   }
}
