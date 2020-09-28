import 'package:arquitecture_clean_getx/presentation/home/cart/cart_screen.dart';
import 'package:arquitecture_clean_getx/presentation/home/products/products_screen.dart';
import 'package:arquitecture_clean_getx/presentation/home/profile/profile_screen.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: IndexedStack(
              index: currentIndex,
              children: [
                ProductsScreeen(),
                Text('current index ${currentIndex}'),
                CartScreen(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                Text('current index ${currentIndex}'),
                ProfileScreen(),
              ],
            )),
            _DeliveryNavigationBar(
                index: currentIndex,
                onIndexSeledcted: (index) {
                  setState(() {
                    currentIndex = index;
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
  const _DeliveryNavigationBar({Key key, this.index, this.onIndexSeledcted})
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
                child: CircleAvatar(
                    radius: 23,
                    backgroundColor: DeliveryColors.purple,
                    child: IconButton(
                        icon: Icon(Icons.shopping_basket,
                            color: index == 2
                                ? DeliveryColors.green
                                : DeliveryColors.white),
                        onPressed: () => onIndexSeledcted(2))),
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
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
