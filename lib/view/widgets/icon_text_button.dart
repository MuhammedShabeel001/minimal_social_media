// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTextButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback ontap;
  const IconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        IconButton.filled(
          onPressed: ontap,
          icon: SvgPicture.asset(icon),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(34, 34),
          ),
        ),
        Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
      ],
    );
  }
}
