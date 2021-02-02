import 'package:arquitecture_clean_getx/presentation/home/home_binding.dart';
import 'package:arquitecture_clean_getx/presentation/home/home_screen.dart';
import 'package:arquitecture_clean_getx/presentation/login/login_binding.dart';
import 'package:arquitecture_clean_getx/presentation/login/login_screen.dart';
import 'package:arquitecture_clean_getx/presentation/main_binding.dart';
import 'package:arquitecture_clean_getx/presentation/splash/splash_binding.dart';
import 'package:arquitecture_clean_getx/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class DeliveryRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class DeliveryPages {
  static final pages = [
    GetPage(
        name: DeliveryRoutes.splash,
        page: () => SplashScreen(),
        bindings: [MainBinding(), SplashBinding()],
        binding: SplashBinding()),
    GetPage(
        name: DeliveryRoutes.login,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: DeliveryRoutes.home,
        binding: HomeBinding(),
        page: () => HomeScreen()),
  ];
}
