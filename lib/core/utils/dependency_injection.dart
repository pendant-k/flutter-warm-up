import 'package:get/get.dart';
import '../../app/services/user_service.dart';

// 서비스 의존성을 한 번에 주입하기 위한 클래스
class DependencyInjection {
  static void init() {
    // Services
    Get.lazyPut<UserService>(() => UserService(), fenix: true);

    // 추가 서비스들을 여기에 등록
    // Get.lazyPut<ApiService>(() => ApiService(), fenix: true);
    // Get.lazyPut<StorageService>(() => StorageService(), fenix: true);
  }
}
