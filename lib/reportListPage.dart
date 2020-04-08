import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dsc_solution_challenge_2020/components/report_card.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/mainPage.dart';

List<Profile> profiles1 = profiles;

// List<Profile> profiles =[Profile(name: '펭 수펭펭', age: 10, address: 'EBS소품실', photo: AssetImage('images/pengsoo.jpeg'), comments: '펭-하!', phoneNumber: '비밀',gender: '남'), Profile(name: '펭 하', age: 15, address: 'EBS소품실', photo: AssetImage('images/pengsoo.jpeg'), comments: '펭-하!', phoneNumber: '비밀',gender: '여')];
class ReportListPage extends StatefulWidget {

  static const String id = 'report_list_page';

  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     FlatButton(
              //       child: Icon(
              //         Icons.keyboard_arrow_left,
              //         color: Colors.black87,
              //         size: 40.0,
              //       ),
              //       onPressed: (){
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only( left: 10.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '보고서 리스트',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Container(
                    //   width: 80.0,
                    // ),
                  ]
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ContainerBox(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return PersonalReportCard(profiles1[index]);
                    },
                    itemCount: profiles1.length,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}