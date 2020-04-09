import 'package:dsc_solution_challenge_2020/components/customAppBar.dart';
import 'package:dsc_solution_challenge_2020/loginPage.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';
import 'package:dsc_solution_challenge_2020/reportPage.dart';
import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/mainPage.dart';
import 'package:dsc_solution_challenge_2020/signUpPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC HUFS Solution Challenge 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CustomAppBar(),
      // initialRoute: MainPage.id,
      initialRoute: LoginPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        // ReportPage.id: (context) => ReportPage(),
        CustomAppBar.id: (context) => CustomAppBar(),
      },
    );
  }
}
