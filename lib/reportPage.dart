import 'package:dsc_solution_challenge_2020/components/alertPopup.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

enum HealthState { good, normal, bad }
enum ContactYesOrNo { yes, no }
enum SocialYesOrNo { yes, no }

class ReportPage extends StatefulWidget {
  final String name;
  final String currentEmail;

  ReportPage(this.name, this.currentEmail);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _firestore = Firestore.instance;
  DateTime now = DateTime.now();
  DateTime visitDate = DateTime.now();
  HealthState _healthState = HealthState.good;
  ContactYesOrNo _contact = ContactYesOrNo.yes;
  SocialYesOrNo _social = SocialYesOrNo.yes;
  String _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: ContainerBox(Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Create Date',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            now.toString().substring(0, 10),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Visit Date',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              visitDate.toString().substring(0, 10),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                            onTap: () async {
                              DateTime picked = await showDatePicker(
                                  context: context,
                                  initialDate: visitDate,
                                  firstDate: DateTime(2019),
                                  lastDate: DateTime(2101));
                              if (picked.isAfter(now)) {
                                alertPopup(context, 3);
                              } else if (picked != null &&
                                  picked != visitDate) {
                                setState(() {
                                  visitDate = picked;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Health',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'good',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<HealthState>(
                                value: HealthState.good,
                                groupValue: _healthState,
                                onChanged: (HealthState value) {
                                  setState(() {
                                    _healthState = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'normal',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<HealthState>(
                                value: HealthState.normal,
                                groupValue: _healthState,
                                onChanged: (HealthState value) {
                                  setState(() {
                                    _healthState = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'bad',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<HealthState>(
                                value: HealthState.bad,
                                groupValue: _healthState,
                                onChanged: (HealthState value) {
                                  setState(() {
                                    _healthState = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Family contact',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Yes',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<ContactYesOrNo>(
                                value: ContactYesOrNo.yes,
                                groupValue: _contact,
                                onChanged: (ContactYesOrNo value) {
                                  setState(() {
                                    _contact = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'No',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<ContactYesOrNo>(
                                value: ContactYesOrNo.no,
                                groupValue: _contact,
                                onChanged: (ContactYesOrNo value) {
                                  setState(() {
                                    _contact = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Social activities',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Yes',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<SocialYesOrNo>(
                                value: SocialYesOrNo.yes,
                                groupValue: _social,
                                onChanged: (SocialYesOrNo value) {
                                  setState(() {
                                    _social = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'No',
                                style: new TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio<SocialYesOrNo>(
                                value: SocialYesOrNo.no,
                                groupValue: _social,
                                onChanged: (SocialYesOrNo value) {
                                  setState(() {
                                    _social = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Activity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Write here',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          _note = value;
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 200,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        _firestore
                            .collection('Accounts')
                            .document(widget.currentEmail)
                            .collection('ElderInfo')
                            .document(widget.name)
                            .collection('Report')
                            .document(now.toString().substring(0, 19))
                            .setData({
                          'reportDate': now,
                          'visitDate': visitDate,
                          'helthState': _healthState.toString(),
                          'contact': _contact.toString(),
                          'social': _social.toString(),
                          'note': _note,
                        });
                        _firestore
                            .collection('Accounts')
                            .document(widget.currentEmail)
                            .collection('ElderInfo')
                            .document(widget.name)
                            .updateData({
                          'latestDate': FieldValue.serverTimestamp(),
                        });
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ))),
    );
  }
}
