import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyTile extends StatelessWidget {
  final String icon;
  final String text;
  final Widget? trailing;
  const MyTile({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: SvgPicture.asset(icon),
      title: Text(text),
      trailing: trailing,
    );
  }
}
