import 'package:arquitecture_clean_getx/presentation/splash/splash_controller.dart';
import 'package:arquitecture_clean_getx/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashControler = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: deliveryGradients)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: FlutterLogo(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white),
            )
          ],
        ),
      ),
    );
  }
}
