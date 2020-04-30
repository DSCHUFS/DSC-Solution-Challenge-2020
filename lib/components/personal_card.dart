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
            radius: 20.0,
            backgroundImage: profile.photo,
          ),
          SizedBox(width:10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
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
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Text(
                          pulse,
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${profile.age} / ${profile.gender}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
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
                    builder: (context) => ManagementPage(
                        profile: profile, currentEmail: currentEmail),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
