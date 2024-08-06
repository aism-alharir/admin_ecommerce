import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Future<bool> AlertExitApp() {
  Get.defaultDialog(
      title: "42".tr,
      middleText: "43".tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("cancel")),
              ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("confirm")),
      ]);
  return Future.value(true);
}
