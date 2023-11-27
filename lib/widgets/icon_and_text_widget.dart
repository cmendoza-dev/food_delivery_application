import 'package:flutter/material.dart';
import 'package:food_delivery_application/utils/dimensions.dart';
import 'package:food_delivery_application/widgets/small_text.dart';

class IconAndTextWigtet extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWigtet({super.key, required this.icon, required this.text,  required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24,),
        const SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}