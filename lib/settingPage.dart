import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
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
                "알림 설정",
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
                value: false,
                title: Text("알림 수신"),
                onChanged: null,
              ),
              SwitchListTile(
                activeColor: Colors.tealAccent[700],
                contentPadding: const EdgeInsets.only(left: 5),
                value: false,
                title: Text("메일 수신"),
                onChanged: null,
              ),
              SwitchListTile(
                activeColor: Colors.tealAccent[700],
                contentPadding: const EdgeInsets.only(left: 5),
                value: false,
                title: Text("업데이트 확인"),
                onChanged: null,
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "개인정보",
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
                  title: Text('정보 변경'),
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
                  title: Text('비밀번호 변경'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "개발자와 소통하기",
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
                  title: Text('공지사항'),
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
                  title: Text('버그 제보하기'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.0),
              _buildDivider(),
              SizedBox(height: 20.0),
              Text(
                "앱 정보",
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
