import 'package:flutter/material.dart';

import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Colors.white,
        ),
        primaryColor: Color(0xFF1E2235),
        scaffoldBackgroundColor: Color(0xFF1E2235),
        textTheme: TextTheme(body1: TextStyle(
          color: Color(0xFFFFFFFF),
        )),
      ),
      home: InputPage(),
    );
  }
}
