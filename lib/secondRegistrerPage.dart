import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/components/customAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondRegisterPage extends StatelessWidget {
  SecondRegisterPage(this.name);

  String name;
  String etcInfo;
  final _firestore = Firestore.instance;

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
                      '기타사항',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        etcInfo = value;
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      maxLines: 12, 
                      keyboardType: TextInputType.text, //줄바꿈
                      decoration: InputDecoration(
                        hintText: "가족사항, 사회참여, 경제상태, 주거환경, 질병, 주요 욕구 등을 입력하세요.",
                        labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey),
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
                    _firestore
                        .collection('Accounts')
                        .document('1@mail.com')
                        .collection('ElderInfo')
                        .document(name)
                        .updateData({
                          'note': etcInfo,
                        });
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  CustomAppBar()), (Route<dynamic> route) => false);
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