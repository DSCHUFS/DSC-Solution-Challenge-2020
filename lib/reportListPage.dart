import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/material.dart';

class ReportListPage extends StatefulWidget {

  static const String id = 'report_list_page';

  @override
  _ReportListPageState createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                margin: EdgeInsets.only(top: 20.0, left: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '보고서 리스트',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 80.0,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.black45,
                        size: 40.0,
                      ),
                      onPressed: () {
                        // Navigator.push(context, 
                        // MaterialPageRoute(builder: (context) => ReportListPage())
                        // );
                      },
                    ),
                  ]
                ),
              ),
              // SizedBox(
              //   height: 40.0,
              // ),
              Expanded(
                child: ContainerBox(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      
                    }
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}