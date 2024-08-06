import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData icon;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 13),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                label,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(icon),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
