import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';
import 'package:dsc_solution_challenge_2020/components/report_card.dart';


class PersonalReportPage extends StatefulWidget {
  final Profile profile;  

  PersonalReportPage(@required this.profile);

  @override
  _PersonalReportPageState createState() => _PersonalReportPageState();
}

class _PersonalReportPageState extends State<PersonalReportPage> {
  
  static const mainTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black87,
                  size: 40.0,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only( left: 10.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Container(
                    //   width: 80.0,
                    // ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.black45,
                        size: 40.0,
                      ),
                      onPressed: () {
                        // Navigator.push(context, 
                        // MaterialPageRoute(builder: (context) => ReportPage())
                        // );
                      },
                    ),
                  ]
                ),
              ),
              // SizedBox(
              //   height: 40.0,
              // ),
              Expanded(
                child: ContainerBox(

                  
                  ListView.builder(
                    itemBuilder: (context, index) {
                      // return PersonalReportCard(profiles1[index]);
                    },
                    itemCount: profiles.length,
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