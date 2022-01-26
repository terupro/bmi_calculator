import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/calculator_brain.dart';
import 'package:untitled/components/icon_content.dart';
import 'package:untitled/components/reusable_card.dart';
import 'package:untitled/components/rounded_icon_button.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/bottom_button.dart';
import 'package:untitled/screens/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  // PROPERTIES
  Gender? selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;

  // BODY
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.male ? kActiveCardColor : kInActiveCardColor,
                      cardChild: IconContent(label: 'MALE', icon: FontAwesomeIcons.male),
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.female ? kActiveCardColor : kInActiveCardColor,
                      cardChild: IconContent(label: 'FEMALE', icon: FontAwesomeIcons.female),
                    ),
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kBodyTextStyle),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(width: 5),
                        Text('cm', style: kBodyTextStyle),
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 200.0,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: RoundedIconButton(
                      label: 'WEIGHT',
                      value: weight,
                      minus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      plus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: RoundedIconButton(
                      label: 'AGE',
                      value: age,
                      minus: () {
                        setState(() {
                          age--;
                        });
                      },
                      plus: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
             Navigator.push(context,  MaterialPageRoute(builder: (context){
                return ResultPage(resultLabel: calc.getResultLabel(), bmiValue: calc.getCalculatorBMI());
              }));
            },
          ),
        ],
      ),
    );
  }
}
