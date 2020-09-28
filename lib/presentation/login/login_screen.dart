import 'package:arquitecture_clean_getx/presentation/home/home_screen.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:arquitecture_clean_getx/presentation/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

const double logoSize = 45;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.5, 1.0],
                                colors: deliveryGradients),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(size.width / 2))),
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: logoSize,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: FlutterLogo(),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Username',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .color),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'username',
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Password',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle
                                  .color)),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(25),
            child: DeliveryButton(
              text: 'Login',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
