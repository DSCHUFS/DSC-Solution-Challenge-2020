import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/reportListPage.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/managementPage.dart';


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
    ReportListPage(),
    ReportListPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            icon: Icon(Icons.format_align_justify),
            title: Text('메뉴'),
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

