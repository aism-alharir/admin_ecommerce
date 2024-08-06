import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String textTitle; 
  const CustomTextTitleAuth({Key? key, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          textTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ));
  }
}
