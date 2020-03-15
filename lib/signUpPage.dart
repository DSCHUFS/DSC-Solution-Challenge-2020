import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpPage extends StatefulWidget {
  static const id = 'signIn_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String chkPassword;
  String name;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                // horizontal: 30.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('회원가입',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(height: 30.0),
                  Container(
                    height: 175,
                    child: ContainerBox(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'E-mail(이메일)',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: '이메일을 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            key: Key('email'),
                            validator: (value) {
                              if (!EmailValidator.validate(value, true)) {
                                return '이메일 형식이 아닙니다.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    child: ContainerBox(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '비밀번호',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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
                                size: 30,
                              ),
                              hintText: '비밀번호를 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    child: ContainerBox(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '비밀번호 확인',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
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
                                Icons.lock,
                                color: Colors.blue,
                                size: 30,
                              ),
                              hintText: '비밀번호를 다시 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    child: ContainerBox(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '이름',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: '이름을 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            validator: (value) {
                              return value.isEmpty ? "이름을 작성해주세요." : null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 175,
                    child: ContainerBox(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '주민번호',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: '앞 7자리까지 입력해주세요.',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            validator: (value) {
                              if (value.length != 7) {
                                return "7자리 입력해주세요.";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 200,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      content: Text("성공적으로 가입되었습니다."),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("확인"),
                                        )
                                      ],
                                    );
                                  });
                            }
                          } catch (e) {
                            print(e);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content: Text("이미 존재하는 계정입니다."),
                                    actions: <Widget>[
                                      new FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("확인"),
                                      )
                                    ],
                                  );
                                });
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      },
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        '제출',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
