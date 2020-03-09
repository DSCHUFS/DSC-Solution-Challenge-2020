import 'package:dsc_solution_challenge_2020/signInPage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String reEmail;
  String password;
  bool showSpinner = false;

  final _formKey = GlobalKey<FormState>();
  final _formKeySecond = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          color: Colors.white70,
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1b262c),
                      Color(0xFF0f4c75),
                      Color(0xFF3282b8),
                      Color(0xFFbbe1fa),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
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
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.blue,
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
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
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
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Form(
                                    key: _formKeySecond,
                                    child: AlertDialog(
                                      content: new TextFormField(
                                        key: Key('reEmail'),
                                        validator: (value) {
                                          if (!EmailValidator.validate(
                                              value, true)) {
                                            return '이메일 형식이 아닙니다.';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          reEmail = value;
                                        },
                                        decoration:
                                            InputDecoration(hintText: '이메일'),
                                      ),
                                      actions: <Widget>[
                                        new FlatButton(
                                          child: new Text("확인"),
                                          onPressed: () {
                                            if (_formKeySecond.currentState
                                                .validate()) {
                                              setState(() {
                                                showSpinner = true;
                                              });
                                              try {
                                                setState(() {
                                                  showSpinner = false;
                                                });
                                              } catch (e) {
                                                print(e);
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content:
                                                            Text("없는 이메일 입니다."),
                                                        actions: <Widget>[
                                                          new FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
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
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          padding: EdgeInsets.only(right: 0.0),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _rememberMe,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text("이메일과 비밀번호를 확인해주세요."),
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
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.pushNamed(context, SignInPage.id);
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            '회원가입',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
