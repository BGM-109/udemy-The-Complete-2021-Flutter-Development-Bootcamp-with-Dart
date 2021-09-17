
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.myIcon, this.iconText});

  final IconData myIcon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            myIcon,
            size: 80.0,
          ),
          SizedBox(height: 15.0),
          Text(
            iconText,
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          )
        ]);
  }
}