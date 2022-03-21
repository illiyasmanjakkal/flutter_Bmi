import 'package:bmi/constants.dart';
import 'package:bmi/widget/leftbar.dart';
import 'package:bmi/widget/rightbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculater",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightcontroller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightcontroller,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 75,
                ),
                Container(
                  width: 130,
                  child: Text(
                    "in meters",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Container(
                  width: 40,
                  child: Text(
                    "in kg",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightcontroller.text);
                double _w = double.parse(_weightcontroller.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if (_bmiresult > 25) {
                    _textresult = "You\'re over weight";
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                    _textresult = "You\'re Normal weight";
                  } else {
                    _textresult = "You\'re Under weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textresult.isNotEmpty,
              child: Container(
                child: Text(
                  _textresult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barwidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barwidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barwidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barwidth: 70),
            SizedBox(
              height: 25,
            ),
            RightBar(barwidth: 70),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("About"),
                        content: Text(
                            "Hi Guys, \nThis App is Mainly Created For The Study Purpose"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Ok",
                              style: TextStyle(color: accentHexColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
