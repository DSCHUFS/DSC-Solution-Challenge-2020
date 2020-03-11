import 'package:dsc_solution_challenge_2020/loginPage.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/signUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC HUFS Solution Challenge 2020',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      // initialRoute: MainPage.id,
      initialRoute: LoginPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        
      },
    );
  }
}
