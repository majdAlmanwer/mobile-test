import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesHandlerController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> showErrorMessage(String? message) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Text(message?.tr ?? 'error',
            style: TextStyle(
                fontFamily: 'bold', fontSize: 14, color: Colors.black)),
        messageText: Text('error',
            style: TextStyle(
                fontFamily: 'bold', fontSize: 14, color: Colors.black)),
        duration: const Duration(seconds: 5),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.BOTTOM,
        icon: IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
            },
            icon: Icon(Icons.cancel),
            iconSize: 32,
            color: Colors.red),
        backgroundColor: Colors.red.shade200));
  }

  Future<void> showSuccessMessage(String? message) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Text('success',
            style: TextStyle(
                fontFamily: 'bold', fontSize: 14, color: Colors.black)),
        messageText: Text(message!,
            style: TextStyle(
                fontFamily: 'bold', fontSize: 14, color: Colors.black)),
        duration: const Duration(seconds: 5),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.BOTTOM,
        icon: IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
            },
            icon: Icon(Icons.check_circle),
            iconSize: 32,
            color: Color(0xFF0AB830)),
        backgroundColor: Colors.green.shade200));
  }
}
