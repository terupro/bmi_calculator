import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? cardColor;
  final Widget? cardChild;
  final Function()? onPress;

  const ReusableCard({Key? key,
    required this.cardColor,
    required this.cardChild,
    this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}