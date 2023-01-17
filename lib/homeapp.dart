import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator2/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double bmi = 0;
  String errorText = '';
  String status = '';

  void calculateBMi() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || weight == null) {
      setState(() {
        errorText = "Please enter your Height and Weight";
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        errorText = "Your Height and Weight must be positive numbers";
      });
      return;
    }

    setState(() {
      bmi = weight / pow((height / 100), 2);
      if (bmi < 18.5) {
        status = "Underweight";
      } else if (bmi > 18.5 && bmi < 25) {
        status = 'Normal weight';
      } else if (bmi > 25 && bmi < 30) {
        status = 'Pre-Obesity';
      } else if (bmi > 30 && bmi < 35) {
        status = 'Obesity class 1';
      } else if (bmi > 35 && bmi < 40) {
        status = 'Obesity class 2';
      } else {
        status = 'Obesity class 3';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.warna4,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Height (cm)',
                        labelStyle: TextStyle(color: AppColor.warna1),
                        suffixText: 'centimeters',
                        suffixStyle: TextStyle(color: AppColor.warna1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.warna3),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                        labelStyle: TextStyle(color: AppColor.warna1),
                        suffixText: 'kilograms',
                        suffixStyle: TextStyle(color: AppColor.warna1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.warna3),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: calculateBMi,
                          child: const Text(
                            'Calculate',
                            style: TextStyle(color: AppColor.warna1),
                          ),
                        ),
                      ],
                    ),
                    Text(errorText),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'BMI',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColor.warna1,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '=',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                bmi == 0 ? '00.00' : bmi.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 30, color: AppColor.warna1),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 230,
                            child: SfRadialGauge(
                              enableLoadingAnimation: true,
                              animationDuration: 4500,
                              axes: <RadialAxis>[
                                RadialAxis(
                                    minimum: 0,
                                    maximum: 40,
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                          value: bmi, enableAnimation: true)
                                    ],
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                          startValue: 0,
                                          endValue: 18.5,
                                          color: Colors.blue),
                                      GaugeRange(
                                          startValue: 18.5,
                                          endValue: 25,
                                          color: Colors.green),
                                      GaugeRange(
                                          startValue: 25,
                                          endValue: 30,
                                          color: Colors.yellow.shade700),
                                      GaugeRange(
                                          startValue: 30,
                                          endValue: 35,
                                          color: Colors.orange),
                                      GaugeRange(
                                          startValue: 35,
                                          endValue: 40,
                                          color: Colors.deepOrangeAccent),
                                    ])
                              ],
                            ),
                          ),
                          Text(
                            status,
                            style: TextStyle(
                                fontSize: 25,
                                color: status == 'Underweight'
                                    ? Colors.blue
                                    : status == 'Normal weight'
                                        ? Colors.green
                                        : status == 'Pre-Obesity'
                                            ? Colors.yellow.shade700
                                            : status == 'Obesity class 1'
                                                ? Colors.orange
                                                : status == 'Obesity class 2'
                                                    ? Colors.deepOrangeAccent
                                                    : status ==
                                                            'Obesity class 3'
                                                        ? Colors.red
                                                        : null),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
