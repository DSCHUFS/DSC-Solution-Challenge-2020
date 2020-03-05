import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  
  PersonalCard({
    @required this.name, 
    @required this.age, 
    @required this.photo, 
  });

  final String name;
  final int age;
  final Image photo;

  static const mainTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: photo,
          ),
          SizedBox(width: 20.0,),
          Expanded(
            flex: 5,
            child: Text(
              name,
              style: mainTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${age} 세',
              style: mainTextStyle,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 120.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( 
            color: Colors.grey,
            blurRadius: 3.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              3.0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

