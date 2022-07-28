// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0; // to convert height to feet after they enter in inches
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  // claculating the BMI Method
  void _calculateBMI() {
    //BMI weight Status
    // 18.5 and below - Underweight
    // 18.5 - 24.9 -Normal
    // 25.0 - 29.9 -Overweight
    // 30.0 and above - Obese

    setState(() {
      // these will get the text entered in the textfield by user and pass it here
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12; // converting feet to inches
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;

        // we do the reading here
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Normal Weight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          _resultReading = "Obese. Try Gym";
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              height: 300.0,
              width: 300.0,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  TextField(
                    //age textfield starts here
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'e.g 28',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  TextField(
                    // height textfield starts here
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height in Feet',
                      hintText: 'e.g 6.5',
                      icon: Icon(Icons.insert_chart),
                    ),
                  ),
                  TextField(
                    //weight textfield starts here
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Weight in Ibs',
                      hintText: 'e.g 170',
                      icon: Icon(Icons.line_weight),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.all(10.0)),
                  //calculate button starts here
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: _calculateBMI,
                      color: Colors.pink,
                      // ignore: sort_child_properties_last
                      child: const Text('calculate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_finalResult',
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                Text(
                  '$_resultReading',
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
