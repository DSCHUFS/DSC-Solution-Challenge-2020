import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_solution_challenge_2020/personalReportPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';

//독거 노인 기본정보 확인 페이지
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //뒤로 가기 버튼
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
                    //노인 개인 사진 확인
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: profile.photo,
                    ),
                    //생년월일과 성별 확인
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            profile.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.0,
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
              //기타 사항
              ContainerBox(Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Special Note',
                    style: TextStyle(
                      fontSize: 27.0,
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
              //노인별 보고서 확인
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
                            fontSize: 27.0,
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
                    SizedBox(
                      height: 10.0,
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
              // 기본 정보 확인 - 연락처와 주소
              ContainerBox(Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Basic Information',
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Contact :  ${profile.phoneNumber}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    ' Address   :  ${profile.address}',
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
    );
  }
}
