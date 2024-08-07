import 'package:freelance_job_portal/core/utils/api_service.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo.dart';
import 'package:freelance_job_portal/features/auth/data/auth_repo_impl.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/category_skill_repo.dart';
import 'package:freelance_job_portal/features/categories%20and%20skills/category_skill_repo_impl.dart';
import 'package:freelance_job_portal/features/chat/data/chat_repo.dart';
import 'package:freelance_job_portal/features/chat/data/ChatService.dart';
import 'package:freelance_job_portal/features/photo/photo_repo_impl.dart';
import 'package:freelance_job_portal/features/my_project/data/repo/my_project_repo.dart';
import 'package:freelance_job_portal/features/my_project/data/repo/my_project_repo_impl.dart';
import 'package:freelance_job_portal/features/profile/data/profile_repo.dart';
import 'package:freelance_job_portal/features/profile/data/client_profile_repo_impl.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo.dart';
import 'package:freelance_job_portal/features/home/data/repo/home_repo_impl.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';
import 'package:freelance_job_portal/features/offers/data/repo/offer_repo_impl.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/worker_profile_repo.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/worker_profile_repo_abstract.dart';
import 'package:freelance_job_portal/features/projects/data/repo/project_repo.dart';

import '../../features/projects/data/repo/project_repo_imp.dart';
import '../../features/searsh/data/repo/search_repo_.dart';
import '../../features/searsh/data/repo/search_repo_impl.dart';

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

  static ProfileRepo provideProfileRepo() {
    final apiService = provideApiService();
    return ClientProfileRepoImpl(apiService: apiService);
  }
   static WorkerProfileRepoImpl provideWorkerProfileRepo() {
    final apiService = provideApiService();
    return WorkerProfileRepoImpl(apiService: apiService);
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


  static CategorySkillRepo provideCsRepo() {
    final apiService = provideApiService();
    return CategorySkillRepoImpl(apiService);
  }

  static MyProjectRepo provideMyProjectRepo() {
    final apiService = provideApiService();
    return MyProjectRepoImpl(apiService);
  }

  static SearchRepo provideSearchRepo() {
    final apiService = provideApiService();
    return SearchRepoImpl(apiService);
  }

//    ChatRepo provideChatRepo(String chatUrl) {
//     return ChatRepoImpl(chatUrl);
//   }
  static PhotoRepoImpl providePhotoRepo() {
    final apiService = provideApiService();
    return PhotoRepoImpl(apiService);
  }
}
