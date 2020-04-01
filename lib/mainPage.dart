import 'package:dsc_solution_challenge_2020/loginPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
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

List<Profile> profiles = [
  Profile(
      name: '펭 수펭펭',
      age: 10,
      address: 'EBS소품실',
      photo: AssetImage('images/pengsoo.jpeg'),
      comments: '펭-하!',
      phoneNumber: '비밀',
      gender: '남'),
  Profile(
      name: '펭 하',
      age: 15,
      address: 'EBS소품실',
      photo: AssetImage('images/pengsoo.jpeg'),
      comments: '펭-하!',
      phoneNumber: '비밀',
      gender: '여')
];

class MainPage extends StatefulWidget {
  static const String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  DocumentSnapshot snapshot;
  FirebaseUser loggedInUser;
  String currentEmail;
  String currentName;

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
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('images/pengsoo.jpeg'),
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
                            '사회복지사',
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
                    Container(
                      margin: EdgeInsets.only(left: 110.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              _auth.signOut();
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.id);
                              prefs.setBool('autoLogin', false);
                              prefs.setStringList('ID', ['', '']);
                            },
                            child: Text('Logout'),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications_none,
                              color: Colors.black45,
                              size: 35.0,
                            ),
                            onPressed: () {
                              // 알림 버튼
                            },
                          ),
                        ],
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
                      '보고서',
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black45,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportListPage()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ContainerBox(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return PersonalCard(profiles[index]);
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
