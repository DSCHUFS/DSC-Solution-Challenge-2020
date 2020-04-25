import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:dsc_solution_challenge_2020/components/singleReport_card.dart';

// 테스트용
List<ReportInfo> reports = [
  ReportInfo(contact: 'hi', health: 'we', social: 'jwe', visitDate: 'we', reportDate: 'we', note:' wersajkdflksdfjksadfjlskfjsdlkfjsdlkfjskdlfjsdlkfjsdlkfjsdlkfjsdkfjsdfsdklfjslfksjfslkfsjdlkfj'),
  ReportInfo(contact: 'hi', health: 'we', social: 'jwe', visitDate: 'we', reportDate: 'we', note:' wersajkdflksdfjksadfjlskfjsdlkfjsdlkfjskdlfjsdlkfjsdlkfjsdlkfjsdkfjsdfsdklfjslfksjfslkfsjdlkfj'),
];



class PersonalReportPage extends StatefulWidget {
  final Profile profile;
  final currentEmail;

  PersonalReportPage({@required this.profile, @required this.currentEmail});

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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only(left: 10.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.profile.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black45,
                          size: 40.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportPage(
                                      widget.profile.name,
                                      widget.currentEmail)));
                        },
                      ),
                    ]),
              ),
              // 카드들 들어갈 내용
              Expanded(
                child: ContainerBox(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ReportInfo(
                        contact: reports[index].contact,
                        health: reports[index].contact,
                        social: reports[index].contact,
                        visitDate: reports[index].contact,
                        reportDate: reports[index].contact,
                        note: reports[index].note,

                      );
                    },
                    // itemCount: profiles.length,
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
