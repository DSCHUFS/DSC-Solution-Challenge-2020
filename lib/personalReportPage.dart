import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:dsc_solution_challenge_2020/components/singleReport_card.dart';

class PersonalReportPage extends StatefulWidget {
  final Profile profile;
  final currentEmail;

  PersonalReportPage({@required this.profile, @required this.currentEmail});

  @override
  _PersonalReportPageState createState() => _PersonalReportPageState();
}

class _PersonalReportPageState extends State<PersonalReportPage> {
  final _firestore = Firestore.instance;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black87,
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('Accounts')
                        .document(widget.currentEmail)
                        .collection('ElderInfo')
                        .document(widget.profile.name)
                        .collection('Report')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            final report = snapshot.data.documents[index];
                            final health = report.data['healthState'];
                            final contact = report.data['contact'];
                            final social = report.data['social'];
                            final visitDate = report.data['visitDate'];
                            final reportDate = report.data['reportDate'];
                            final note = report.data['note'] ?? '';
                            return ReportInfo(
                              health: health == 'HealthState.good'
                                  ? 'good'
                                  : health == 'HealthState.noraml'
                                      ? 'normal'
                                      : 'bad',
                              contact:
                                  contact == 'ContactYesOrNo.yes' ? 'yes' : 'no',
                              social:
                                  social == 'SocialYesOrNo.yes' ? 'yes' : 'no',
                              visitDate: visitDate.toDate(),
                              reportDate: reportDate.toDate(),
                              note: note,
                            );
                          },
                          // itemCount: profiles.length,
                        );
                      } else {
                        return CupertinoActivityIndicator();
                      }
                    },
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
