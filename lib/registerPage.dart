import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/components/alertPopup.dart';

class RegisterPage extends StatefulWidget {
  final Function addProfileCallback;

  RegisterPage(this.addProfileCallback);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  String name;
  int age;
  Image photo = Image(image: AssetImage('images/pengsoo.jpeg'),);

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
                  '관리 대상자 등록',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    labelText: "이름을 입력하세요",
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  '나이',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    age = int.parse(value);
                  },
                  decoration: InputDecoration(
                    labelText: "나이를 입력하세요",
                    labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: FlatButton(
                  child: Text('등록하기'),
                  onPressed: () {
                    if(name == null || name == ''){
                      alertPopup(context, 1);
                    }
                    else if(age == null){
                      alertPopup(context, 2);
                    }
                    else{
                      var newProfile = Profile(
                          name: name, 
                          age: age,
                          photo: photo,
                        );
                    print(name); 
                    print(age);
                    print(photo);
                    widget.addProfileCallback(newProfile);
                    name = null;
                    age = null;
                    Navigator.pop(context);
                    }
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