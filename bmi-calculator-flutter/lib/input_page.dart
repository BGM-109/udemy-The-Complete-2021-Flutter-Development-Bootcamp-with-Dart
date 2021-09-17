import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/caculator.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const heightTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

enum genderType {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;
  double _height = 180.0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.male;
                      });
                    },
                    myColor: selectedGender == genderType.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.mars,
                      iconText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    myColor: selectedGender == genderType.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.venus,
                      iconText: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("HEIGHT",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: <Widget>[
                              Text("${_height.round()}", style: heightTextStyle),
                              Text("cm"),
                            ]),
                        Slider(
                          value: _height,
                          min: 120.0,
                          max: 250.0,
                          divisions: 130,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double value) {
                            setState(() {
                              _height = value;
                            });
                          },
                          label: _height.round().toString(),
                        ),
                      ]),
                  myColor: inactiveCardColor,
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT",style:TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98))),
                          Text(weight.toString(),style:heightTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                setState((){
                                  weight--;
                                });
                              } ),
                              SizedBox(width:15.0),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                setState((){
                                  weight++;
                                });
                              }),
                            ]
                          )
    
                          ]
                      ),
                      myColor: inactiveCardColor),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("AGE",style:TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98))),
                            Text(age.toString(),style:heightTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                    setState((){
                                      age--;
                                    });
                                  }),
                                  SizedBox(width:15.0),
                                  RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                    setState((){
                                      age++;
                                    });
                                  }),
                                ]
                            )

                          ]
                      ),
                      myColor: inactiveCardColor),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap:(){
              CalculatorBrain calc = CalculatorBrain(height: _height.toInt(), weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(),)),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Text("CALCULATOR", style: TextStyle(
                fontSize:25.0, fontWeight: FontWeight.w700,
              ))
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      elevation: 6.0,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}