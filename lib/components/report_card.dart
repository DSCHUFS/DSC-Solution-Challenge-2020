import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';

class PersonalReportCard extends StatelessWidget {

  PersonalReportCard(this.profile);

  final Profile profile;

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
            padding: EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '${profile.name}의 보고서',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.0,),
                Text(
                  '최근 업데이트 날짜: 날짜들어감',
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
          //SizedBox(width: 80.0),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black45,
              size: 40.0,
            ),
            // 화살표 누르면 개인별 보고서 페이지 나오도록
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) => ManagementPage(profile),)
              // );
            },
          ),
        ],
      ),
    );
  }
}