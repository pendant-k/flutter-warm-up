import 'package:get/get.dart';
import '../views/home_view.dart';
import '../controllers/home_controller.dart';
import 'app_routes.dart';

class AppPages {
  static const String initial = AppRoutes.home;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    // 추가 라우트들을 여기에 정의
    // GetPage(
    //   name: AppRoutes.userAdd,
    //   page: () => const UserAddView(),
    //   binding: UserAddBinding(),
    // ),
  ];
}
