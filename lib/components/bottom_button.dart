import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const BottomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 15.0),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        height: 80.0,
        color: Colors.black,
      ),
    );
  }
}


