import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isSelectedNotify;

  @override
  void initState() {
    getSetInfo();
    super.initState();
  }

  void getSetInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSelectedNotify = prefs.getBool('notification');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                "Notifications Setting",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'SCDream',
                ),
              ),
              SwitchListTile(
                activeColor: Colors.tealAccent[700],
                contentPadding: const EdgeInsets.only(left: 5),
                value: _isSelectedNotify ?? true,
                title: Text("Receive notifications"),
                onChanged: (value) async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    _isSelectedNotify = value;
                    prefs.setBool('notification', value);
                    // print(prefs.getBool('notification'));
                  });
                },
              ),
              SwitchListTile(
                activeColor: Colors.tealAccent[700],
                contentPadding: const EdgeInsets.only(left: 5),
                value: false,
                title: Text("Receive email notifications"),
                onChanged: null,
              ),
              SwitchListTile(
                activeColor: Colors.tealAccent[700],
                contentPadding: const EdgeInsets.only(left: 5),
                value: false,
                title: Text("Check for updates"),
                onChanged: null,
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "Personal information",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'SCDream',
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.perm_identity,
                    color: Colors.black,
                  ),
                  title: Text('Change information'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.black,
                  ),
                  title: Text('Change password'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "Communicate with developers",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'SCDream',
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                  ),
                  title: Text('Notice'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.bug_report,
                    color: Colors.black,
                  ),
                  title: Text('Bug report'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "About apps",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'SCDream',
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                  title: Text("About this app"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
