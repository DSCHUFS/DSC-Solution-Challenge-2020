import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';

class ManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ContainerBox(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('images/pengsoo.jpeg'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '홍 길 동',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            '69세 / 여',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ContainerBox(
                Text(
                  '특이사항',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              ),
              ContainerBox(
                Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '최근 보고서',
                          style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black45,
                          size: 40.0,
                        ),
                      ],
                    ),
                    Text('2020/01/31 보고서')
                  ],
                ),
              ),
              ContainerBox(
                Text(
                  '기본 정보',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
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