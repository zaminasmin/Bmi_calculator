import 'package:bmicalculator/components/reusable_card.dart';
import 'package:flutter/material.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({required this.interpretation, required this.bmiResult, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',style: TextStyle(fontSize:30),

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(onPress: (){},
              colour: Colors.black54,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(color: Colors.white,fontSize: 30),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50),

                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 20),

                  ),
                ],
              ),
            ),
          ),
        TextButton(child: Text('RE-CALCULATE',style: TextStyle(color: Colors.black),),
          onPressed: (){
    Navigator.pop(context);
    },
    ) ,
        ],
      ),
    );
  }
}