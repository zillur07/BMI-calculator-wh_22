import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hw_22/src/config/calculatorBrain.dart';
import 'package:hw_22/src/page/homePage.dart';

class ResultPage extends StatefulWidget {
  ResultPage({
    this.yourBMI,
  });

  double? yourBMI;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double? bmi = widget.yourBMI;
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
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Your Result',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                bottom: 10,
              ),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 540,
              decoration: BoxDecoration(
                color: HexColor('#1D1E33'),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmi! > 25
                        ? 'Over Weight'
                        : bmi > 18
                            ? 'NORMAL'
                            : 'Under Weight',
                    style: TextStyle(
                      color: 18 <= bmi && bmi <= 25 ? Colors.teal : Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 210,
                    width: 170,
                    child: Card(
                      child: Image.asset(
                        bmi >= 25
                            ? 'img/jambu.jpg'
                            : bmi > 18
                                ? 'img/I.jpg'
                                : 'img/k.jpg',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.teal,
                    ),
                    child: Text(
                      '${widget.yourBMI?.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      bmi > 25
                          ? 'You have a higher than normal body weight. Try to exercise more.'
                          : bmi > 18
                              ? 'You have a normal body weight. Good job!'
                              : 'You have a lower than normal body weight. You can eat a bit more.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            18 <= bmi && bmi <= 25 ? Colors.teal : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.pink,
                      ),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
