import 'package:flutter/material.dart';
import '../../../core/constant/imageasset.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 150,
    );
  }
}
