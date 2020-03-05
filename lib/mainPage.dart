import 'package:flutter/material.dart';
import 'package:dsc_solution_challenge_2020/components/personal_card.dart';
import 'package:dsc_solution_challenge_2020/models/profile.dart';
import 'package:dsc_solution_challenge_2020/registerPage.dart';

List<Profile> profiles = [Profile(name: '펭 수', age: 10, address: 'EBS소품실', photo: Image(image: AssetImage('images/pengsoo.jpeg')), comments: '펭-하!', phoneNumber: '비밀')];

class MainPage extends StatefulWidget {
  
  static const String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      '관리 대상 리스트',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return PersonalCard(
                      name: profiles[index].name,
                      age: profiles[index].age,
                      photo: profiles[index].photo,
                    );
                  },
                  itemCount: profiles.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterPage((newProfile) {
                      setState(() {
                        profiles.add(newProfile);
                      });
                    }))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}