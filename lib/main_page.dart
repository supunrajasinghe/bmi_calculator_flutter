// ignore_for_file: prefer_const_constructors

import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = "";

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "M";
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                          color: gender == 'M' ? Colors.blue : Colors.yellow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.male_rounded, size: 150),
                            Text("Male"),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "F";
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 175,
                        decoration: BoxDecoration(
                          color: gender == 'F' ? Colors.blue : Colors.yellow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.female_rounded, size: 150),
                            Text("Female"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Height"),
                          Text(
                            "$height",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    height--;
                                    bmi = calculateBMI(
                                      height: height,
                                      weight: weight,
                                    );
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    height++;
                                    bmi = calculateBMI(
                                      height: height,
                                      weight: weight,
                                    );
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Weight"),
                          Text(
                            "$weight",
                            style: kInputLabelColor,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                    bmi = calculateBMI(
                                      height: height,
                                      weight: weight,
                                    );
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    bmi = calculateBMI(
                                      height: height,
                                      weight: weight,
                                    );
                                  });
                                },
                                child: Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const Text(
                      "BMI",
                    ),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: kInputLabelColor.copyWith(
                        color: kOutputTextColor,
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }
}
