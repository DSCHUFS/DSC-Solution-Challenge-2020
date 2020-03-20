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

List<Profile> profiles = [Profile(name: '펭 수', age: 10, address: 'EBS소품실', photo: AssetImage('images/pengsoo.jpeg'), comments: '펭-하!', phoneNumber: '비밀',gender: '남'), Profile(name: '펭 하', age: 15, address: 'EBS소품실', photo: AssetImage('images/pengsoo.jpeg'), comments: '펭-하!', phoneNumber: '비밀',gender: '여')];

class MainPage extends StatefulWidget {
  
  static const String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _auth = FirebaseAuth.instance;

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
                            '홍 길 동',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            ' 사회복지사',
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
                      child: InkWell(
                        onTap: () async {
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          _auth.signOut();
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                          prefs.setBool('autoLogin', false);
                          prefs.setStringList('ID', ['', '']);
                        },
                        child: Text('Logout'),
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
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => ReportListPage())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ContainerBox(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return FlatButton(
                        child: PersonalCard(
                          name: profiles[index].name,
                          age: profiles[index].age,
                          photo: profiles[index].photo,
                          gender: profiles[index].gender,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ManagementPage(profiles[index]),)
                          );
                        },
                      );
                    },
                    itemCount: profiles.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage((newProfile) {
                    setState(() {
                      profiles.add(newProfile);
                    });
                  }))
          );
        },
        child: Icon(Icons.add),
      ),
      // bottomNavigationBar: CustomAppBar(),
    );
  }
}