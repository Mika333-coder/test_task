import 'package:get/get.dart';
import 'package:test_task/core/presentation/views/main/main_screen.dart';

class AppRoutes {
  // root navigation routes
  static const mainRoute = '/main';

  static const rootNavigationKey = 0;

  static final List<GetPage> _rootRoutes = [
    GetPage(
      name: mainRoute,
      page: () => const MainScreen(),
    ),
  ];

  static List<GetPage> get rootRoutes => _rootRoutes;

  static Future<T?>? goTo<T>(
    String page, {
    bool hasBack = true,
    dynamic arguments,
    int? id = rootNavigationKey,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    if (hasBack) {
      return Get.toNamed(
        page,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
      );
    }

    return Get.offAllNamed(
      page,
      arguments: arguments,
      parameters: parameters,
      id: id,
    );
  }

  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id = rootNavigationKey,
  }) {
    Get.back(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }
}
