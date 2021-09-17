import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText});
  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI CALCULATOR")),
        body: Column(children: <Widget>[
          Expanded(
              child: Container(
                padding:EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                  child: Text("Your Result",
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.w700)))),
          Expanded(
            flex: 5,
            child: ReusableCard(
              myColor: Color(0xFF111328),
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w700)),
                    Text(bmiResult,
                        style: TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.bold)),
                    Text(
                        "You hav a higher than normal body wight. Try. to exersicse",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                        ))
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.center,
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Text("RE-CALCULATOR",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ))),
          )
        ]));
  }
}
