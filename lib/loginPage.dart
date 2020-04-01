import 'package:dsc_solution_challenge_2020/components/customAppBar.dart';
import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool autologin = false;

  final _formKey = GlobalKey<FormState>();
  final _formKeySecond = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isAutoLogin = prefs.getBool('autoLogin');
    final List<String> savedUserInfo = prefs.getStringList('ID');

    setState(() {
      showSpinner=true;
    });
    if (isAutoLogin == true) {
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: savedUserInfo[0], password: savedUserInfo[1]);
        if (user != null) {
          Navigator.pushNamed(context, CustomAppBar.id);
        }
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      showSpinner=false;
    });
  }

  @override
  void initState() {
    autoLogIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            color: Colors.white70,
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
                    Text('로그인',
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.black),
                            child: Checkbox(
                              value: autologin,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  autologin = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            '자동 로그인',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Form(
                                  key: _formKeySecond,
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    content: new TextFormField(
                                      keyboardType: TextInputType.emailAddress,
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
                                        onPressed: () async {
                                          if (_formKeySecond.currentState
                                              .validate()) {
                                            setState(() {
                                              showSpinner = true;
                                            });
                                            try {
                                              await _auth
                                                  .sendPasswordResetEmail(
                                                      email: reEmail);
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      content:
                                                          Text("이메일을 확인해주세요."),
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
                                            } catch (e) {
                                              print(e);
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      content: Text(
                                                          "존재하지 않는 계정입니다."),
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
                          '비밀번호를 잊어버렸습니다',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        },
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              if (user != null) {
                                Navigator.pushNamed(context, CustomAppBar.id);
                                prefs.setBool('autoLogin', autologin);
                                if (autologin) {
                                  prefs.setStringList('ID', [email, password]);
                                } else {
                                  prefs.setStringList('ID', ['', '']);
                                }
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
                        padding: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          '로그인',
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
            )),
      ),
    );
  }
}
