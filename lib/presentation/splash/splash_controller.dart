import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:arquitecture_clean_getx/presentation/routes/delivery_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController(
      {this.localRepositoryInterface, this.apiRepositoryInterface});

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }
}
