import 'package:arquitecture_clean_getx/domain/repository/api_repository.dart';
import 'package:arquitecture_clean_getx/domain/repository/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController({this.localRepositoryInterface, this.apiRepositoryInterface});

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void login() {
    final username = userNameTextController.text;
    final password = passwordTextController.text;
  }
}
