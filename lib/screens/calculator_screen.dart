import 'package:bmicalculator/Provider/Bmiprovider.dart';

import 'package:bmicalculator/components/reusable_card.dart';

import 'package:bmicalculator/screens/result_screen.dart';
import 'package:bmicalculator/utils/calculate_bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  late Gender selectedGender ;
  int height = 180;
  int selected=0;


  Widget customRadio(String text ,int index) {
    return Container();
  }
  @override

  Widget build(BuildContext context) {
    bool gender=Provider.of<BmiProvider>(context).getgender;
    int weight = Provider
        .of<BmiProvider>(context)
        .getweight;
    int age = Provider
        .of<BmiProvider>(context)
        .getage;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {Provider.of<BmiProvider>(context,listen: false).male();


              },
                child: Card(color: (gender==true)?Colors.red:Colors.white,
                  child: Container(
                    height: 200,
                    width: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(Icons.male, size: 80)

                        ),
                        SizedBox(height: 10,),
                        Text('MALE')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){Provider.of<BmiProvider>(context,listen: false).female();},
                child: Card(color: (gender==false)?Colors.red:Colors.white,
                  child: Container(
                    height: 200,
                    width: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                              Icons.female,
                              size: 80,
                            ),
                          ),

                        SizedBox(
                          height: 20,
                        ),
                        Text('FEMALE')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ReusableCard(
                colour: Colors.white,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'cm',
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.black,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 220.0,
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
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue,
                child: Container(

                  height: 230,
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 60, width: 60,
                            decoration: BoxDecoration(color: Colors.white24,
                                borderRadius: BorderRadius.circular(30)),
                            child: IconButton(
                                onPressed: () {
                                  Provider.of<BmiProvider>(
                                      context, listen: false).minweight();
                                }, icon: Icon(Icons.remove)),

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 60, width: 60, decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(30)),
                              child: IconButton(
                                  onPressed: () {
                                    Provider.of<BmiProvider>(
                                        context, listen: false).addweight();
                                  }, icon: Icon(Icons.add)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                color: Colors.blue,
                child: Container(

                  height: 230,
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 60, width: 60,
                            decoration: BoxDecoration(color: Colors.white24,
                                borderRadius: BorderRadius.circular(30)),
                            child: IconButton(
                                onPressed: () {
                                  Provider.of<BmiProvider>(
                                      context, listen: false).minage();
                                }, icon: Icon(Icons.remove)),

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 60, width: 60, decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(30)),
                              child: IconButton(
                                  onPressed: () {
                                    Provider.of<BmiProvider>(
                                        context, listen: false).addage();
                                  }, icon: Icon(Icons.add)))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            color: Colors.red,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 80,
            child: TextButton(onPressed: () {
              BmiLogic calc =
              BmiLogic(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                ),
              );
            },
                child: Text(
                  "CALCULATE",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );

    /*StreamBuilder(
        stream: FirebaseFirestore.instance.collection("data").snapshots(),
        builder:
        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return*/
    /*   Column(
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? Colors.red
                          :Colors.green,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? Colors.red
                          : Colors.green,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: ReusableCard(
              colour: Colors.red,
              onPress:(){},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),

                      ),
                      Text(
                        'cm',

                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
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
              children: <Widget>[
                Expanded(
                  child: ReusableCard(onPress: (){},
                    colour: Colors.grey,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',

                        ),
                        Text(
                          weight.toString(),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(onPress: (){},
                    colour: Colors.brown,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',

                        ),
                        Text(
                          age.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                      () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed:  () {
              BmiLogic calc =
              BmiLogic(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
    child: Text('CALCULATE'),
          ),
        ],
      )*/ /*;
        }),*/
  }
}
