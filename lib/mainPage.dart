import 'package:dsc_solution_challenge_2020/alertListPage.dart';
import 'package:dsc_solution_challenge_2020/loginPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/personal_card.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/components/customAppBar.dart';
import 'package:dsc_solution_challenge_2020/managementPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MainPage extends StatefulWidget {
  static const String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  DocumentSnapshot snapshot;
  FirebaseUser loggedInUser;
  String currentEmail;
  String currentName;
  bool _isSelectedNotify;

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

  void getSetInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSelectedNotify = prefs.getBool('notification') ?? true;
    });
    _firebaseMessaging.getToken().then((token) {
      _firestore.collection('Accounts').document(currentEmail).updateData({
        "registrationTokens": FieldValue.arrayUnion([token])
      });
    });
  }

  @override
  void initState() {
    getCurrentUser();
    getSetInfo();
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
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('images/DSCHUFS.png'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            currentName ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Social Worker',
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
                    // 로그아웃 버튼
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right:20),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                if (_isSelectedNotify) {
                                  setState(() {
                                    _isSelectedNotify = false;
                                    prefs.setBool('notification', false);
                                    // print(prefs.getBool('notification'));
                                  });
                                } else {
                                  setState(() {
                                    _isSelectedNotify = true;
                                    prefs.setBool('notification', true);
                                    // print(prefs.getBool('notification'));
                                  });
                                }
                              },
                              icon: Icon(
                                _isSelectedNotify ?? true
                                    ? Icons.notifications_active
                                    : Icons.notifications_off,
                                color: _isSelectedNotify ?? true
                                    ? Colors.blue
                                    : Colors.black45,
                                size: 35.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            InkWell(
                              onTap: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                _auth.signOut();
                                _firebaseMessaging.getToken().then((token) {
                                  _firestore
                                      .collection('Accounts')
                                      .document(currentEmail)
                                      .updateData({
                                    "registrationTokens":
                                        FieldValue.arrayRemove([token])
                                  });
                                });
                                Navigator.pushReplacementNamed(
                                    context, LoginPage.id);
                                prefs.setBool('autoLogin', false);
                                prefs.setStringList('ID', ['', '']);
                              },
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ContainerBox(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Notification List',
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //알림 >
                    Row(
                      children: <Widget>[
                        StreamBuilder<QuerySnapshot>(
                          stream: _firestore
                              .collection('Accounts')
                              .document(currentEmail)
                              .collection('notifications')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int i = 0;
                              for (final notification
                                  in snapshot.data.documents) {
                                if (notification.data['isChecked'] == false)
                                  i++;
                              }
                              if (i != 0) {
                                return CircleAvatar(
                                  radius: 15,
                                  child: Text(i.toString()),
                                  backgroundColor: Colors.yellow[300],
                                  foregroundColor: Colors.redAccent,
                                );
                              } else
                                return Opacity(opacity: 0);
                            } else
                              return CupertinoActivityIndicator();
                          },
                        ),
                        IconButton(
                          iconSize: 40,
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black45,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlertListPage(
                                          currentEmail: currentEmail,
                                        )));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                            final elderAge = elderInfo.data['IdNum'];
                            final elderGender = elderInfo.data['gender'];
                            final elderPhoto = elderInfo.data['photo'];
                            final elderNumber = elderInfo.data['phoneNum'];
                            final elderETCinfo = elderInfo.data['note'];
                            return StreamBuilder<DocumentSnapshot>(
                              stream: _firestore
                                  .collection('pulse_log')
                                  .document('NcxLYL2kLhIGaI8e0Yvj')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return PersonalCard(
                                    Profile(
                                      name: elderName,
                                      address: elderAddress,
                                      age: elderAge,
                                      photo: FirebaseImage(elderPhoto),
                                      comments: elderETCinfo,
                                      phoneNumber: elderNumber,
                                      gender: elderGender,
                                    ),
                                    snapshot.hasData
                                        ? snapshot.data.data['pulse'].toString()
                                        : '',
                                    currentEmail);
                              },
                            );
                          },
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
