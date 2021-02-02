import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({this.localRepositoryInterface});

  final LocalRepositoryInterface localRepositoryInterface;
}
