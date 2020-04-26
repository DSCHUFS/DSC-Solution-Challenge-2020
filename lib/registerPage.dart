import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/alertPopup.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:dsc_solution_challenge_2020/secondRegistrerPage.dart';
import 'package:dsc_solution_challenge_2020/components/genderSelectBox.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  String name;
  String age;
  String address;
  String number;
  String gender;

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
                    'Register',
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
                        'Name',
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
                          labelText: "Write name",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        'Address',
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
                          labelText: "Write address",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        'Contact',
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
                        'Birthday',
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
                          labelText: "Write birthday",
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height:30.0),
                      Text(
                        'Gender',
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
                      'Next',
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
                        alertPopup(context, 4);
                      }
                      else if(number == null || number == ''){
                        alertPopup(context, 5);
                      }
                      else if(age == null || age == ''){
                        alertPopup(context, 2);
                      }
                      else if(gender == null){
                        alertPopup(context, 6);
                      }
                      else{
                        print(name); 
                        print(age);
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