import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/personalReportPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';

class PersonalReportCard extends StatelessWidget {

  PersonalReportCard(this.profile, this.currentEmail, this.latestDate);

  final Profile profile;
  final currentEmail;
  final latestDate;

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
          Container(
            padding: EdgeInsets.symmetric(vertical:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${profile.name}\'s report',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                // SizedBox(height: 5.0,),
                Text(
                  'Last Update Date: \n$latestDate',
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
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black45,
              size: 40.0,
            ),
            // 화살표 누르면 개인별 보고서 페이지 나오도록
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => PersonalReportPage(profile: profile, currentEmail: currentEmail,),)
              );
            },
          ),
        ],
      ),
    );
  }
}