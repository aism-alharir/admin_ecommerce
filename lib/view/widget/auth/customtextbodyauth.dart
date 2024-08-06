import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textBody;
  const CustomTextBodyAuth({ Key? key, required this.textBody }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 110),
              child: Text(
                textBody,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
  }
}