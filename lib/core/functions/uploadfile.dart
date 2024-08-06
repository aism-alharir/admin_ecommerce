import 'dart:io';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottonMenu(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "اختيار الصورة",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.soucondColor),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              title: const Text("صورة من الكاميرا",
                  style: TextStyle(fontSize: 20)),
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              title: const Text(
                "صورة من الاستديو",
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
            )
          ],
        ),
      )));
}
