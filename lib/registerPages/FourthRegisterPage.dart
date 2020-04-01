import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/registerPages/FifthRegisterPage.dart';
import 'package:dsc_solution_challenge_2020/components/checkBox.dart';

class FourthRegisterPage extends StatelessWidget {

  String bodyArea;

  String bodyConsultationRecord;

  bool isChecked1=false;
  bool isChecked2=false;
  bool isChecked3=false;

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
                      '신체영역',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        CheckBox(
                          isChecked1
                        ),
                        Text('만성질환'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked2
                        ),
                        Text('장애'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked3
                        ),
                        Text('치아'),
                        
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        CheckBox(
                          isChecked1
                        ),
                        Text('시력'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked2
                        ),
                        Text('청력'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked3
                        ),
                        Text('보조기'),
                        CheckBox(
                          isChecked1
                        ),
                        Text('기타'),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerBox(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '상담기록',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        bodyConsultationRecord = value;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FifthRegisterPage()));
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