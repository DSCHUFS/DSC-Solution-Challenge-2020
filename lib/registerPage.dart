import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:io' show Platform;

enum Gender {
  male,
  female,
}

const List<String> infoList = ['클라이언트', '생활관리사', '보호자'];

class RegisterPage extends StatefulWidget {
  static const id = 'register_page';


  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String chkPassword;
  String name;
  int age = 65;
  Gender selectedGender = Gender.male;
  String selectedInfo = '클라이언트';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in infoList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedInfo,
      items: dropdownItems,
      onChanged: (value) {
        selectedInfo = value;
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in infoList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.white,
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedInfo = infoList[selectedIndex];
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100, bottom: 50),
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 500,
                      child: ListView(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '이메일',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Card(
                                elevation: 8.0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: 'Enter your Email',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    key: Key('email'),
                                    validator: (value) {
                                      if (!EmailValidator.validate(
                                          value, true)) {
                                        return '이메일 형식이 아닙니다.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      email = value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '비밀번호',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                elevation: 8.0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    key: Key('password'),
                                    validator: (value) {
                                      if (value.length < 6) {
                                        return '6자리 이상 입력해주세요.';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Enter your Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '비밀번호 확인',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                elevation: 8.0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      return (password != value)
                                          ? '비밀번호가 일치하지 않습니다.'
                                          : null;
                                    },
                                    obscureText: true,
                                    onChanged: (value) {
                                      chkPassword = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Enter your Password again',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '이름',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                elevation: 8.0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      return (value.isEmpty)
                                          ? '이름을 입력해주세요.'
                                          : null;
                                    },
                                    obscureText: true,
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      hintText: 'Enter your Name',
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '나이',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Card(
                                elevation: 8.0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: <Widget>[
                                          Text(
                                            age.toString(),
                                            // style: kNumberTextStyle,
                                          ),
                                          Text(
                                            '세',
                                            // style: kLabelTextStyle,
                                          )
                                        ],
                                      ),
                                      SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          inactiveTrackColor: Color(0xFF8D8E98),
                                          activeTrackColor: Colors.blue,
                                          thumbColor: Color(0xFFEB1555),
                                          overlayColor: Color(0x29EB1555),
                                          thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 15.0),
                                          overlayShape: RoundSliderOverlayShape(
                                              overlayRadius: 20.0),
                                        ),
                                        child: Slider(
                                          value: age.toDouble(),
                                          min: 20.0,
                                          max: 120.0,
                                          onChanged: (double newValue) {
                                            setState(() {
                                              age = newValue.round();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '성별',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    elevation: 8.0,
                                    margin: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedGender == Gender.male) {
                                              selectedGender = Gender.female;
                                            } else {
                                              selectedGender = Gender.male;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 60,
                                          child: FlareActor(
                                            "assets/GenderPicker.flr",
                                            animation:
                                                selectedGender == Gender.male
                                                    ? "switch_male"
                                                    : "switch_female",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '가입 정보',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    elevation: 8.0,
                                    margin: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        width: 150,
                                        height: 60,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(0),
                                        color: Colors.black,
                                        child: Platform.isIOS
                                            ? iOSPicker()
                                            : androidDropdown(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //dropdown Button
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 5.0,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              child: Text(
                                '제출',
                                style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}

