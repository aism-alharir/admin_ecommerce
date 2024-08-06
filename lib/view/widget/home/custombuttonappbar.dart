import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final bool active;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.textbutton,
    required this.iconData,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          Text(
            textbutton,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey2 ),
          )
        ],
      ),
    );
  }
}
