import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo_impl.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';
import 'package:freelance_job_portal/features/chat/data/ChatService.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';
import 'package:freelance_job_portal/features/profile/data/client_profile_repo_impl.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo_impl.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo_impl.dart';
import 'package:freelance_job_portal/features/projects/data/repo/project_repo.dart';

import '../../features/projects/data/repo/project_repo_imp.dart';

class DependencyInjection {
  static AuthTokenService provideAuthTokenService() {
    return AuthTokenService();
  }

  static ApiService provideApiService() {
    final authTokenService = provideAuthTokenService();
    return ApiService(
      baseUrl: 'http://10.0.2.2:8080/api/v1/',
      authTokenService: authTokenService,
    );
  }

  static AuthRepo provideAuthRepo() {
    final apiService = provideApiService();
    final authTokenService = provideAuthTokenService();
    return AuthRepoImpl(apiService, authTokenService);
  }

  static ProfileRepo provideProfileRepo() {
    final apiService = provideApiService();
    return ClientProfileRepoImpl(apiService: apiService);
  }

  static ProjectRepo provideProjectRepo() {
    final apiService = provideApiService();
    return ProjectRepoImp(apiService);
  }

  static HomeRepo provideHomeRepo() {
    final apiService = provideApiService();
    return HomeRepoImpl(apiService);
  }

  static OfferRepo provideOfferRepo() {
    final apiService = provideApiService();
    return OfferRepoImpl(apiService);
  }

//    ChatRepo provideChatRepo(String chatUrl) {
//     return ChatRepoImpl(chatUrl);
//   }
}
