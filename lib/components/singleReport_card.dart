import 'package:flutter/material.dart';

class ReportInfo extends StatelessWidget {
  ReportInfo({this.contact, this.health, this.social, this.visitDate,
      this.reportDate, this.note});

  final String contact;
  final String health;
  final String social;
  final DateTime visitDate;
  final DateTime reportDate;
  final String note;

  static const mainTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Creation Date: ${reportDate.toString().substring(0,10)}',
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
                      'Visit Date: ${visitDate.toString().substring(0,10)}',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Physical condition: $health',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Contact: $contact',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Social Activity: $social',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Text(
          'Activity and Special note',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Container(
          child: Text('$note'),
        )
      ],
    ));
  }
}
