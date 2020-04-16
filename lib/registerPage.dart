import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/alertPopup.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/secondRegistrerPage.dart';
import 'package:dsc_solution_challenge_2020/components/genderSelectBox.dart';

class RegisterPage extends StatefulWidget {
  final Function addProfileCallback;

  RegisterPage(this.addProfileCallback);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  String name;
  String age;
  String address;
  String number;
  String gender;

  ImageProvider photo = AssetImage('images/pengsoo.jpeg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
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
                        '성함(이름)',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                          labelText: "이름을 입력하세요",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        '주소',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          address = value;
                        },
                        decoration: InputDecoration(
                          labelText: "주소를 입력하세요",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        '연락처',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          number = value;
                        },
                      ),
                      SizedBox(height:30.0),
                      Text(
                        '생년월일',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          age = value;
                        },
                        decoration: InputDecoration(
                          labelText: "생년월일을 입력하세요",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        '성별',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height:10.0),
                      Row(children: <Widget>[
                        GenderSelectBox(
                          onPress: (){
                            setState((){
                              gender = 'male';
                            });
                          },
                          label: 'MALE',
                          colour: gender == 'male' ? Colors.blue[300] : Colors.white,
                        ),
                        SizedBox(width: 10),
                        GenderSelectBox(
                          onPress:(){
                            setState((){
                              gender = 'female';
                            });
                          },
                          label: 'FEMALE',
                          colour: gender == 'female' ? Colors.blue[300] : Colors.white,
                        ),
                      ],),
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
                      if(name == null || name == ''){
                        alertPopup(context, 1);
                      }
                      else if(address == null || address == ''){
                        alertPopup(context, 2);
                      }
                      else if(number == null || number == ''){
                        alertPopup(context, 1);
                      }
                      else if(age == null || age == ''){
                        alertPopup(context, 1);
                      }
                      else if(gender == null){
                        alertPopup(context, 1);
                      }
                      else{
                        print(name); 
                        print(age);
                        print(photo);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondRegisterPage(
                          name:name,
                          gender: gender,
                          age: age,
                          address: address,
                          number: number,
                          )));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}