import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';
import 'package:dsc_solution_challenge_2020/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/managementPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatefulWidget {
  static const id = 'customAppBar_page';

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    MainPage(),
    //RegisterPage(),
    ReportListPage(),
    RegisterPage(),
    SettingPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    int i = 0;
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      print('token:' + token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool isNotify = prefs.getBool('notification') ?? true;
        if (isNotify) {
          if (i % 2 == 0 || !Platform.isAndroid) {
            print('on message $message');
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: ListTile(
                  title: Text(message["notification"]["title"]),
                  subtitle: Text(message["notification"]["body"]),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            );
            i = 0;
          }
          i++;
        }
      },
      onResume: (Map<String, dynamic> message) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool isNotify = prefs.getBool('notification') ?? true;
        if (isNotify) {
          print('on resume $message');
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool isNotify = prefs.getBool('notification') ?? true;
        if (isNotify) {
          print('on launch $message');
        }
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        // iconSize: 30.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('홈'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text('보고서'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('추가'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('환경설정'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
