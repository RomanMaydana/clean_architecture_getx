import 'package:arquitecture_clean_getx/data/datasource/local_repository_impl.dart';
import 'package:arquitecture_clean_getx/presentation/home/home_controller.dart';
import 'package:arquitecture_clean_getx/presentation/home/profile/profile_controller.dart';
import 'package:arquitecture_clean_getx/presentation/routes/delivery_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();
  // final controller = Get.put(
  //   () => ProfileController(
  //     localRepositoryInterface: Get.find()
  //   )
  // );

  void logout() async {
    await controller.logOut();
    Get.offAllNamed(DeliveryRoutes.splash);
  }

  void onThemeUpdated(bool isDark) {
    controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user.value;
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: user.image != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: DeliveryColors.green),
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(user.image),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(user.username,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Card(
                                color: Theme.of(context).canvasColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text('Personal Information',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .accentColor)),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Text(user.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Row(
                                        children: [
                                          Text('Dark mode'),
                                          Spacer(),
                                          Switch(
                                              activeColor:
                                                  DeliveryColors.purple,
                                              value: controller.darkTheme.value,
                                              onChanged: onThemeUpdated)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Center(
                                child: RaisedButton(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        'Log Out',
                                        style: TextStyle(
                                            color: DeliveryColors.white),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: DeliveryColors.purple,
                                    onPressed: logout))
                          ]))
                ],
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
