import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/registerPages/FourthRegisterPage.dart';

class ThirdRegisterPage extends StatelessWidget {

  String economicStatus;
  String residentialEnvironment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  '등록하기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ContainerBox(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '경제상태',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        economicStatus = value;
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      maxLines: 7, 
                      keyboardType: TextInputType.text, //줄바꿈
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0,  vertical: 20.0),
                        border: InputBorder.none,
                      ),
                    ),
                   
                  ],
                ),
              ),
              ContainerBox(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '주거환경',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        residentialEnvironment = value;
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      maxLines: 7, 
                      keyboardType: TextInputType.text, //줄바꿈
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0,  vertical: 20.0),
                        border: InputBorder.none,
                      ),
                    ),
                   
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
                  child: Text(
                    '다음',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FourthRegisterPage()));
                  },
                ),
              ),
            ],
          ),
            
        ),
      ),
    );
  }
}