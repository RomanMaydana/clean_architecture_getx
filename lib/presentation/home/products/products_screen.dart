import 'package:arquitecture_clean_getx/data/in_memory_products.dart';
import 'package:arquitecture_clean_getx/domain/model/product.dart';
import 'package:arquitecture_clean_getx/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class ProductsScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Products',
        )),
        body: GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              final product = products[index];
              return _ItemProduct(product: product);
            }));
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key key, this.product}) : super(key: key);

  final Product product;

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
              text: 'Login',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
