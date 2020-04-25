import 'package:flutter/material.dart';

class Profile{

  final String name;
  final String address;
  final String age;
  final ImageProvider photo;
  final String comments;
  final String phoneNumber;
  final String gender;
  //보호자 이름, 전화번호 등등등등등

  Profile({
    this.name, 
    this.address, 
    this.age, 
    this.gender,
    this.photo, 
    this.comments, 
    this.phoneNumber
  });


}