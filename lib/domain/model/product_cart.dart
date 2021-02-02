import 'package:arquitecture_clean_getx/domain/model/product.dart';

class ProductCart {
  ProductCart({this.product, this.quantity = 1});

  final Product product;
  int quantity;
}
