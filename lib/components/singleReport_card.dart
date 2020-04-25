import 'package:flutter/material.dart';

class ReportInfo extends StatelessWidget {
  ReportInfo({this.contact, this.health, this.social, this.visitDate,
      this.reportDate, this.note});

  final String contact;
  final String health;
  final String social;
  final String visitDate;
  final String reportDate;
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
                      '작성 날짜: $reportDate',
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
                      '방문 날짜: $visitDate',
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
                        '간강상태: $health',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '연락여부: $contact',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '사회활동: $social',
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
          '활동 및 특이사항',
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
