import 'package:arquitecture_clean_getx/domain/model/product.dart';
import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({this.apiRepositoryInterface});

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList.value = result;
  }
}
