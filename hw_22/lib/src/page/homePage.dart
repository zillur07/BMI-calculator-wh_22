import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hw_22/src/config/calculatorBrain.dart';
import 'package:hw_22/src/page/resultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  // bool isFemale = true;
  int weight = 60;
  int age = 20;
  double height = 90;
  var bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0A0E21'),
      appBar: AppBar(
        backgroundColor: HexColor('#0A0E21'),
        elevation: 0,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        isMale = true;
                      });
                    }),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: isMale == true
                            ? HexColor('#101227')
                            : HexColor('#1C1D31'),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        isMale = false;
                      });
                    }),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: isMale == false
                            ? HexColor('#101227')
                            : HexColor('#1C1D31'),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(15),
              height: double.infinity,
              decoration: BoxDecoration(
                color: HexColor('#1C1D31'),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white38,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '${height.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                        ),
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                      thumbColor: Colors.pink,
                      overlayColor: Colors.pink.withOpacity(.5),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                    child: Slider(
                        max: 220,
                        min: 40,
                        value: height,
                        onChanged: (v) {
                          setState(() {
                            height = v;
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor('#1C1D31'),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(15),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor('#1C1D31'),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                final calculate = CalculatorBrain(
                  age: age,
                  height: height,
                  weight: weight,
                );
                bmiResult = calculate.getResult();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        yourBMI: bmiResult,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Text(
                    'Calculator',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
