import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/managementPage.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard(this.profile, this.pulse, this.currentEmail);

  final Profile profile;
  final String pulse;
  final String currentEmail;

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
            backgroundImage: profile.photo,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  profile.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${profile.age} / ${profile.gender}',
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
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              pulse,
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black45,
              size: 40.0,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagementPage(profile, currentEmail),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
