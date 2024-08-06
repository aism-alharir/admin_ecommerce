import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text;
  final String textTow;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.text,
      required this.textTow,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        InkWell(
          onTap: onTap,
          child: Text(
            textTow,
            style: const TextStyle(color: AppColor.primaryColor, fontSize: 13),
          ),
        )
      ],
    );
  }
}
