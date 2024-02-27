import 'package:get/get.dart';

import '../../features/dashboard/cloud/views/screens/cloud_screen.dart';
import '../../features/dashboard/home/views/screens/home_screen.dart';
import '../../features/dashboard/index/views/screens/dashboard_screen.dart';
import '../../features/dashboard/pertanyaan/bindings/pertanyaan_binding.dart';
import '../../features/dashboard/pertanyaan/views/pertanyaan_view.dart';
import '../../features/splash/views/screens/splash_screen.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened this page will be the first to be shown
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        CloudBinding(),
        // PertanyaanBinding()
      ],
    ),
    GetPage(
      name: _Paths.pertanyaan,
      page: () => PertanyaanView(inputData: Map<String, String>()),
      binding: PertanyaanBinding(),
    ),
  ];
}
