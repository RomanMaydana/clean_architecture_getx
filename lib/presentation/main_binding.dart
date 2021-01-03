import 'package:arquitecture_clean_getx/data/datasource/api_repository_impl.dart';
import 'package:arquitecture_clean_getx/data/datasource/local_repository_impl.dart';
import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalReopositoryImp());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
