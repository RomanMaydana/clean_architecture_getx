import 'package:arquitecture_clean_getx/presentation/home/cart/cart_controller.dart';
import 'package:get/instance_manager.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepositoryInterface: Get.find()));

    Get.lazyPut(() => CartController());
  }
}
