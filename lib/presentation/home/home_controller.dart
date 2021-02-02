import 'package:arquitecture_clean_getx/domain/model/user.dart';
import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({this.localRepositoryInterface, this.apiRepositoryInterface});
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  Rx<User> user = User.empty().obs;
  RxInt currentIndex = 0.obs;
  RxBool darkTheme = false.obs;

  @override
  void onInit() {
    loadCurrentTheme();
    super.onInit();
  }

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then((value) => user(value));
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void loadCurrentTheme() {
    localRepositoryInterface.isDarkMode().then((value) => darkTheme(value));
  }

  void updateIndexSelected(int index) {
    currentIndex(index);
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
