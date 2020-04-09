import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';

class alertListPage extends StatefulWidget {
  
  static const String id = 'alert_list_page';
  
  @override
  _alertListPageState createState() => _alertListPageState();
}

class _alertListPageState extends State<alertListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     FlatButton(
              //       child: Icon(
              //         Icons.keyboard_arrow_left,
              //         color: Colors.black87,
              //         size: 40.0,
              //       ),
              //       onPressed: (){
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only( left: 10.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '알림 목록',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Container(
                    //   width: 80.0,
                    // ),
                  ]
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Expanded(
              //   child: ContainerBox(
                  
              //   ),
              // ),
            ],
          ),
        ),

      ),
    );
  }
}