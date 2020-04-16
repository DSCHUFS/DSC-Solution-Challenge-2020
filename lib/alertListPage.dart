import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';

class AlertListPage extends StatefulWidget {
  static const String id = 'alert_list_page';
  final currentEmail;

  AlertListPage({this.currentEmail});

  @override
  AlertListPageState createState() => AlertListPageState();
}

class AlertListPageState extends State<AlertListPage> {
  final _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '알림 목록',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black87,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection('Accounts')
                          .document(widget.currentEmail)
                          .collection('notifications')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final notification = snapshot.data.documents[
                                  snapshot.data.documents.length - index - 1];
                              final elderName = notification.data['ElderName'];
                              final pulse = notification.data['pulse'];
                              final time = notification.data['timestamp']
                                  .toDate()
                                  .toString()
                                  .substring(0, 19);
                              bool isChecked = notification.data['isChecked'];
                              return Card(
                                  color: isChecked
                                      ? Colors.white38
                                      : Colors.yellow[100],
                                  child: ExpansionTile(
                                    title: Text(elderName+'님의 위험이 감지되었습니다.'),
                                    subtitle: Text(time),
                                    onExpansionChanged: (value) async {
                                      if (!isChecked) {
                                        //TODO : 업데이트 해야함
                                      }
                                    },
                                    children: <Widget>[
                                      ListTile(
                                          title:
                                              Text('맥박 : ' + pulse.toString()))
                                    ],
                                  ));
                            },
                          );
                        } else {
                          return CupertinoActivityIndicator();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
