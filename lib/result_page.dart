import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/ctm_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String bmiResult;
  final String result;
  final String review;

  ResultPage(
      {required this.bmiResult,
      required this.result,
      required this.review,
      Key? key})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);

  @override
  void initState() {
    animationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              child: Center(
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 50),
            ),
          )),
          Expanded(
              flex: 5,
              child: Ctm_Card(
                  position: new Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animationController),
                  onTap: () {},
                  color: const Color(0xFF1D1E33),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.result,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.bmiResult.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.review,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ))),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEB1555),
              ),
              child: const Center(
                  child: Text(
                'Re-Calculate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
