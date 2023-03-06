import 'dart:async';
import 'dart:ffi';

import 'package:bmi_calculator/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  // height: 12,
                  'assets/blood-donation.png',
                  color: Colors.pink,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'BMI CALCULATOR',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 300,
            ),
            const CircularProgressIndicator(
              color: Colors.pink,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Check your BMI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
