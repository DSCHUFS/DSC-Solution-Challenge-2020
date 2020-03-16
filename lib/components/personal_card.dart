import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  
  PersonalCard({
    @required this.name, 
    @required this.age, 
    @required this.photo, 
    @required this.gender,
  });

  final String name;
  final int age;
  final ImageProvider photo;
  final String gender;

  static const mainTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            backgroundImage: photo,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.0,),
                Text(
                  '$age / $gender',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(width: 80.0),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}