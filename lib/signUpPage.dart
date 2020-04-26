import 'package:dsc_solution_challenge_2020/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dsc_solution_challenge_2020/components/containerBox.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  static const id = 'signIn_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firestore = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String chkPassword;
  String name;
  bool showSpinner = false;
  String frontIdNum;
  String backIdNum;
  FocusNode resNum;

  @override
  void initState() {
    resNum = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    resNum.dispose();
    super.dispose();
  }

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
                  Text('Sign Up',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  // SizedBox(height: 30.0),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                        padding: EdgeInsets.only(right: 0.0, bottom: 0.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
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
                            'E-mail',
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
                              hintText: 'Write e-mail.',
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
                                return 'It\'s not email format.';
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
                            'Password',
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
                                return 'Write more than 6 letters.';
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
                              hintText: 'Write password.',
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
                            'Confirm password',
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
                                  ? 'Password do not match.'
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
                              hintText: 'Please enter your password again.',
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
                            'Name',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            onChanged: (value) {
                              name = value;
                            },
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Write name.',
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
                              return value.isEmpty ? "Write name." : null;
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
                            'Social Security Number',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length == 6) {
                                      resNum.requestFocus();
                                    }
                                    frontIdNum = value;
                                  },
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(6),
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Birthday',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.length != 6) {
                                      return "Please enter 6 digits.";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 15),
                              Flexible(
                                child: TextFormField(
                                  onChanged: (value) {
                                    backIdNum = value;
                                  },
                                  focusNode: resNum,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '1 digit in front',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter 1 digit in front.";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
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
                              _firestore
                                  .collection('Accounts')
                                  .document(email)
                                  .setData({
                                'email': email,
                                'name': name,
                                'IdNum': frontIdNum + backIdNum,
                              });
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      content: Text("Success"),
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
                                    content: Text("This account already exists."),
                                    actions: <Widget>[
                                      new FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Confirm"),
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
                        'Submit',
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
