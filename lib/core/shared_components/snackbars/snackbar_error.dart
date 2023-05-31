import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showErrorSnackbar([String message ='Ocorreu um erro desconhecido']) {
  return Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.red,
      message: message,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      duration:const Duration(seconds: 3),
    ),
  );
}
