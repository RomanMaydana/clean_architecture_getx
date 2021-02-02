import 'package:arquitecture_clean_getx/data/in_memory_products.dart';
import 'package:arquitecture_clean_getx/domain/model/product.dart';
import 'package:arquitecture_clean_getx/presentation/home/cart/cart_controller.dart';
import 'package:arquitecture_clean_getx/presentation/home/products/products_controller.dart';
import 'package:arquitecture_clean_getx/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class ProductsScreeen extends StatelessWidget {
  final controller = Get.put<ProductsController>(
      ProductsController(apiRepositoryInterface: Get.find()));
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Products',
        )),
        body: Obx(
          () => controller.productList.isNotEmpty
              ? GridView.builder(
                  itemCount: controller.productList.length,
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return _ItemProduct(
                      product: product,
                      onTap: () {
                        cartController.add(product);
                      },
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key key, this.product, this.onTap}) : super(key: key);

  final Product product;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: CircleAvatar(
              backgroundColor: Colors.black,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    )),
              ),
            )),
            Expanded(
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(color: DeliveryColors.lightGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${product.price} USD',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              text: 'Add',
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
