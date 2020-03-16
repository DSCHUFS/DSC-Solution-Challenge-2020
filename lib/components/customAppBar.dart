import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.green,
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
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
    );
  }
}

