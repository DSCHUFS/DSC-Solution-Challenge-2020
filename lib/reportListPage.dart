import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dsc_solution_challenge_2020/components/report_card.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//보고서 리스트 페이지
class ReportListPage extends StatefulWidget {
  static const String id = 'report_list_page';

  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  DocumentSnapshot snapshot;
  FirebaseUser loggedInUser;
  String currentEmail;
  String currentName;

  //현재 유저 확인
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        currentEmail = loggedInUser.email;
        snapshot = await _firestore
            .collection('Accounts')
            .document(currentEmail)
            .get();
        setState(() {
          currentName = snapshot.data['name'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only(left: 10.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Report List',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              //리스트뷰로 작성된 보고서들 모두 확인, 포맷은 components의 report_card.dart
              Expanded(
                child: ContainerBox(
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection('Accounts')
                          .document(currentEmail)
                          .collection('ElderInfo')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final elderInfo = snapshot.data.documents[index];
                              final elderName = elderInfo.data['name'];
                              final elderAddress = elderInfo.data['address'];
                              final elderAge = elderInfo.data['age'];
                              final elderGender = elderInfo.data['gender'];
                              final latestDate = elderInfo.data['latestDate'];
                              return PersonalReportCard(
                                  Profile(
                                    name: elderName,
                                    address: elderAddress,
                                    age: elderAge,
                                    gender: elderGender,
                                  ),
                                  currentEmail,
                                  latestDate != null
                                      ? latestDate.toDate().toString().substring(0,10)
                                      : 'None');
                            },
                          );
                        } else {
                          return CupertinoActivityIndicator();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
