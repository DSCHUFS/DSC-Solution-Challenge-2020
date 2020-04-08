import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {

  final Widget inputChild;
  ContainerBox(this.inputChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: inputChild,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      //height: 80.0,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( 
            color: Colors.grey[300],
            blurRadius: 3.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              3.0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}