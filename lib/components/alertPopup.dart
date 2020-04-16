import 'package:flutter/material.dart';

Future alertPopup(BuildContext context, String type) {

  String textContent;

  if(type == 'name'){
    textContent = 'Write name.';
  }
  else if(type == 'address'){
    textContent = 'Write address.';
  }
  else if(type == 'number'){
    textContent = 'Write phone number.';
  }
  else if(type == 'address'){
    textContent = 'Write address.';
  }
  else if(type == 'age'){
    textContent = 'Select age.';
  }
  else if(type == 'gender'){
    textContent = 'Select gender.';
  }
  else if(type == 'etcInfo'){
    textContent = 'Write Information.';
  }

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text((() {
            switch (number) {
              case 1:
                return 'Write name.';
                break;
              case 2:
                return 'Write age.';
                break;
              default:
                return '방문 날짜는 작성날짜 이후가 될 수 없습니다.';
            }
          })()),
          // number == 1? Text('Write name.'): Text('Write age'),
          actions: <Widget>[
            FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      });
}
