import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/registerPages/SixthRegisterPage.dart';
import 'package:dsc_solution_challenge_2020/components/checkBox.dart';

class FifthRegisterPage extends StatelessWidget {

  String mentalArea;
  String mentalConsultationRecord;

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
                      '정신영역',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        CheckBox(
                          isChecked1
                        ),
                        Text('인지기능'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked2
                        ),
                        Text('약물복용'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked3
                        ),
                        Text('우울증'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        CheckBox(
                          isChecked1
                        ),
                        Text('자살'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked2
                        ),
                        Text('음주'),
                        SizedBox(width:7),
                        CheckBox(
                          isChecked3
                        ),
                        Text('치매'),
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
                        mentalConsultationRecord = value;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SixthRegisterPage()));
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