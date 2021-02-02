import 'package:arquitecture_clean_getx/data/in_memory_products.dart';
import 'package:arquitecture_clean_getx/domain/model/product.dart';
import 'package:arquitecture_clean_getx/domain/model/product_cart.dart';
import 'package:arquitecture_clean_getx/presentation/home/cart/cart_controller.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:arquitecture_clean_getx/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CartScreen extends GetWidget<CartController> {
  CartScreen({Key key, this.onShopping}) : super(key: key);

  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Shopping Cart',
        )),
        body: Obx(() {
          return controller.totalItems.value == 0
              ? _EmptyCart(
                  onShopping: onShopping,
                )
              : _FullCart();
        })
        //  _EmptyCart(
        //   onShopping: onShopping,
        // ),
        );
  }
}

class _FullCart extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1 / 0.7,
            // color: Colors.blue,
            child: Container(
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.cartList.length,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 230,
                    itemBuilder: (context, index) {
                      final productCart = controller.cartList[index];
                      return _ShoppingProduct(
                          productCart: productCart,
                          onDelete: () {
                            controller.deleteProduct(productCart);
                          },
                          onIncrement: () {
                            controller.increment(productCart);
                          },
                          onDecrement: () {
                            controller.decrement(productCart);
                          });
                    }),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 0),
              child: Container(
                // height: 250,
                // padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: Theme.of(context).accentColor),
                              ),
                              Text('0.0 usd',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          color: Theme.of(context).accentColor))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: Theme.of(context).accentColor),
                              ),
                              Text('free',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          color: Theme.of(context).accentColor))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor),
                              ),
                              Obx(
                                () => Text(
                                    '\$${controller.totalPrice.toStringAsFixed(2)} USD',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    DeliveryButton(
                      text: 'Checkout',
                      onTap: () {},
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class _ShoppingProduct extends StatelessWidget {
  const _ShoppingProduct(
      {Key key,
      this.productCart,
      this.onDelete,
      this.onIncrement,
      this.onDecrement})
      : super(key: key);

  final ProductCart productCart;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.all(15.0),
      child: Stack(children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 2,
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
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: onDecrement,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: DeliveryColors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.remove,
                                  color: DeliveryColors.purple,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${productCart.quantity}'),
                            ),
                            InkWell(
                              onTap: onIncrement,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: DeliveryColors.purple,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.add,
                                  color: DeliveryColors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$${product.price} USD',
                              style: TextStyle(color: DeliveryColors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: InkWell(
              onTap: onDelete,
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ))
      ]),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({Key key, this.onShopping}) : super(key: key);
  final VoidCallback onShopping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          color: DeliveryColors.green,
          size: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Go shopping',
                    style: TextStyle(color: DeliveryColors.white),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: DeliveryColors.purple,
                onPressed: onShopping))
      ],
    );
  }
}
