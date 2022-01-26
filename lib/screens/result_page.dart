import 'package:flutter/material.dart';
import 'package:untitled/components/bottom_button.dart';
import 'package:untitled/components/reusable_card.dart';
import 'package:untitled/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiValue;
  final String resultLabel;
  const ResultPage({
    Key? key,
    required this.bmiValue,
    required this.resultLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'YOUR RESULT',
              textAlign: TextAlign.center,
              style: kYourResultText,
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultLabel.toUpperCase(),
                    style: kResultLabel,
                  ),
                  Text(
                    bmiValue,
                    style: kResultValue,
                  ),
                  Column(
                    children: [
                      Text('Normal BMI range:', style: kResultDescription),
                      SizedBox(height: 10),
                      Text('18.5 ~ 24.9 kg / m²', style: kBodyTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Higher BMI range:', style: kResultDescription),
                      SizedBox(height: 10),
                      Text('25 ~ kg / m²', style: kBodyTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Lower BMI range:', style: kResultDescription),
                      SizedBox(height: 10),
                      Text('~ 18.4 kg / m²', style: kBodyTextStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'RECALCULATE',
            onPressed: () {
              Navigator.pop(context); // 移動したい画面の名前を設定する
            },
          ),
        ],
      ),
    );
  }
}
