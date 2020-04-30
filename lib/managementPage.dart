import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_solution_challenge_2020/personalReportPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';

class ManagementPage extends StatelessWidget {
  final Profile profile;
  final String currentEmail;

  ManagementPage({@required this.profile, @required this.currentEmail});

  @override
  Widget build(BuildContext context) {
    final _firestore = Firestore.instance;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
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
                ContainerBox(
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: profile.photo,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              profile.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
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
                    ],
                  ),
                ),
                ContainerBox(Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Special Note',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      profile.comments,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )),
                ContainerBox(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Latest report',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PersonalReportPage(
                                      profile: profile,
                                      currentEmail: currentEmail,
                                    ),
                                  ));
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black45,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<DocumentSnapshot>(
                        stream: _firestore
                            .collection('Accounts')
                            .document(currentEmail)
                            .collection('ElderInfo')
                            .document(profile.name)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final latestDate = snapshot.data.data['latestDate'];
                            return Text(
                              latestDate != null
                                  ? latestDate
                                      .toDate()
                                      .toString()
                                      .substring(0, 10)
                                  : 'do not exist',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black87,
                              ),
                            );
                          } else {
                            return CupertinoActivityIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ContainerBox(Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      // '기본 정보',
                      'Basic Information',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Contact : ${profile.phoneNumber}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      ' Address : ${profile.address}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
