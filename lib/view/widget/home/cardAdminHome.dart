import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final void Function()? onClick;
  final String urlimage;
  final String tiile;
  const CardAdminHome(
      {super.key,required this.onClick, required this.urlimage, required this.tiile});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlimage,
              height: 80,
            ),
            Text(tiile),
          ],
        ),
      ),
    );
  }
}
