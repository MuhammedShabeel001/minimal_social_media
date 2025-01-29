// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Widget? icon;
  final String filtername;
  final Color color;
  const FilterButton({
    super.key,
    this.icon,
    required this.filtername,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(35)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: icon,
              ),
        ),
        Text(filtername, style: TextStyle(fontSize: 20),),
        
      ],
    );
  }
}
