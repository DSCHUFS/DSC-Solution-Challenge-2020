import 'package:flutter/material.dart';

class GenderSelectBox extends StatelessWidget {
  GenderSelectBox({this.onPress, this.label, this.colour});

  final Function onPress;
  final String label;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 25,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}