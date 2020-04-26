import 'package:flutter/material.dart';

class ReportInfo extends StatelessWidget {
  ReportInfo(
      {this.contact,
      this.health,
      this.social,
      this.visitDate,
      this.reportDate,
      this.note});

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
      padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Create Date: ${reportDate.toString().substring(0,10)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                        'Health: $health',
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
                        'Social: $social',
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
        // SizedBox(
        //   height:10.0,
        // ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
          'Special note',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          height: 200.0,
          width: 500.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text('$note'),
        ),
      ],
    ));
  }
}
