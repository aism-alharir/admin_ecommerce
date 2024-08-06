import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLanguage(
      {Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      child: MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          color: AppColor.primaryColor,
          child: Text(
            textButton,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
