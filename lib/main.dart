import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  TextEditingController H = TextEditingController();
  TextEditingController W = TextEditingController();
  double bmi_result = 0.0;

  void Calculate() {
    double height = double.parse(H.text);
    double weight = double.parse(W.text);
    double result = 0.0;
    result = weight / ((height / 100) * (weight / 100));
    setState(() {
      bmi_result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextField(
                controller: W,
                decoration: const InputDecoration(
                  labelText: "Weight in Kgs",
                  icon: Icon(Icons.line_weight),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: H,
                decoration: const InputDecoration(
                  labelText: "Height in cm",
                  icon: Icon(Icons.height_rounded),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Calculate();
                  });
                },
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 25),
              Text(
                "BMI: ${bmi_result}",
                style: const TextStyle(fontSize: 25, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
