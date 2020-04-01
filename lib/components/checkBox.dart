import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  bool isChecked = false;

  CheckBox(this.isChecked);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  void _onIsCheckedChanged(bool newValue) => setState(() {
    widget.isChecked = newValue;

    if (widget.isChecked) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      onChanged: _onIsCheckedChanged,
    );
  }
}