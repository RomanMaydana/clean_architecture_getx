import 'package:arquitecture_clean_getx/presentation/home/cart/cart_controller.dart';
import 'package:arquitecture_clean_getx/presentation/home/cart/cart_screen.dart';
import 'package:arquitecture_clean_getx/presentation/home/home_controller.dart';
import 'package:arquitecture_clean_getx/presentation/home/products/products_screen.dart';
import 'package:arquitecture_clean_getx/presentation/home/profile/profile_controller.dart';
import 'package:arquitecture_clean_getx/presentation/home/profile/profile_screen.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: Obx(() {
              return IndexedStack(
                index: controller.currentIndex.value,
                children: [
                  ProductsScreeen(),
                  const Placeholder(),
                  CartScreen(
                    onShopping: () {
                      controller.currentIndex.value = 0;
                    },
                  ),
                  const Placeholder(),
                  ProfileScreen(),
                ],
              );
            })),
            Obx(() {
              return _DeliveryNavigationBar(
                  index: controller.currentIndex.value,
                  onIndexSeledcted: (index) {
                    controller.updateIndexSelected(index);
                    // setState(() {
                    //   currentIndex = index;
                    // });
                  });
            })
          ],
        ),
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSeledcted;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  _DeliveryNavigationBar({Key key, this.index, this.onIndexSeledcted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Theme.of(context).bottomAppBarColor, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                child: IconButton(
                    icon: Icon(
                      Icons.home,
                      color: index == 0
                          ? DeliveryColors.green
                          : DeliveryColors.lightGrey,
                    ),
                    onPressed: () => onIndexSeledcted(0)),
              ),
              Material(
                child: IconButton(
                    icon: Icon(Icons.store,
                        color: index == 1
                            ? DeliveryColors.green
                            : DeliveryColors.lightGrey),
                    onPressed: () => onIndexSeledcted(1)),
              ),
              Material(
                child: Stack(
                  children: [
                    CircleAvatar(
                        radius: 23,
                        backgroundColor: DeliveryColors.purple,
                        child: IconButton(
                            icon: Icon(Icons.shopping_basket,
                                color: index == 2
                                    ? DeliveryColors.green
                                    : DeliveryColors.white),
                            onPressed: () => onIndexSeledcted(2))),
                    Positioned(
                      right: 0,
                      child: Obx(
                        () => cartController.totalItems.value == 0
                            ? const SizedBox.shrink()
                            : CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.pinkAccent,
                                child:
                                    Text('${cartController.totalItems.value}'),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Material(
                child: IconButton(
                    icon: Icon(Icons.favorite_border,
                        color: index == 3
                            ? DeliveryColors.green
                            : DeliveryColors.lightGrey),
                    onPressed: () => onIndexSeledcted(3)),
              ),
              InkWell(
                onTap: () => onIndexSeledcted(4),
                child: Obx(() {
                  final user = controller.user.value;
                  return user.image == null
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(user.image),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
