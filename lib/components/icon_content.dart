import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: kBodyTextStyle,
        ),
      ],
    );
  }
}