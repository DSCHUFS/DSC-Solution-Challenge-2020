import 'package:flutter/material.dart';

Future alertPopup(BuildContext context, int number) {
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Alert!'),
        content: number == 1? Text('Write name.'): Text('Write age'),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: (){
              Navigator.pop(context);
              }
            ),
          ],
        );
      }
    );
  }