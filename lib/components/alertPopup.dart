import 'package:flutter/material.dart';

Future alertPopup(BuildContext context, int number) {
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
              case 3:
                return 'Creation date can\'t be before Visit date.';
                break;
              case 4:
                return 'Write address.';
                break;
              case 5:
                return 'Write phone number';
                break;
              case 6:
                return 'Select gender.';
                break;
              case 7:
                return 'Select smaller image than 2500000 bytes.';
                break;
              case 8:
                return 'Write information.';
                break;
              default:
                return '';
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