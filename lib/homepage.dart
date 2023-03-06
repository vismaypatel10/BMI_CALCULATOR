import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/ctm_card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int height = 50;
  int weight = 0;
  int age = 0;
  bool isMale = false;
  bool isFemale = false;

  late AnimationController animationController =
      // AnimationController(duration: const Duration(seconds: 5), vsync: this)
      //   ..repeat(min: 0);
      AnimationController(vsync: this, duration: Duration(seconds: 2));

  // late Animation<Offset> animation = Tween<Offset>(
  //   begin: const Offset(-1.0, 0.0),
  //   end: Offset.zero,
  // ).animate(animationController);

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
          backgroundColor: const Color(0xFF0A0E21),
          title: const Text('BMI Calculator'),
          centerTitle: true,
          elevation: 2,
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Ctm_Card(
                        position: new Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animationController),
                        onTap: () {
                          setState(() {
                            if (isMale == false && isFemale == false ||
                                isFemale == true) {
                              isMale = true;
                              isFemale = false;
                            }
                          });
                        },
                        color: const Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.mars,
                                size: 80,
                                color: isMale == true
                                    ? Colors.pink
                                    : Colors.white),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'MALE',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ))),
                Expanded(
                    child: Ctm_Card(
                        position: new Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animationController),
                        onTap: () {
                          setState(() {
                            if (isFemale == false && isMale == true ||
                                isMale == false) {
                              isFemale = true;
                              isMale = false;
                            }
                          });
                        },
                        color: const Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.venus,
                                size: 80,
                                color: isFemale == true
                                    ? Colors.pink
                                    : Colors.white),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'FEMALE',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ))),
              ],
            )),
            Expanded(
                child: Ctm_Card(
                    position: new Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animationController),
                    onTap: () {},
                    color: const Color(0xFF1D1E33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              'cm',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: const Color(0xFF8D8E98),
                              thumbColor: Colors.pink,
                              trackHeight: 1,

                              // overlayColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink),
                          child: Slider(
                            value: height.toDouble(),
                            min: 50,
                            max: 250,
                            onChanged: (double value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'HEIGHT',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Ctm_Card(
                        position: new Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animationController),
                        onTap: () {},
                        color: const Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weight.toString(),
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 0) {
                                          weight--;
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Invalid Argument')));
                                        }
                                      });
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: Ctm_Card(
                        position: new Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animationController),
                        onTap: () {},
                        color: const Color(0xFF1D1E33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (age > 0) {
                                          age--;
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Invalid Argument')));
                                        }
                                      });
                                    }),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        )))
              ],
            )),
            GestureDetector(
              onTap: () {
                if (weight > 0 && age > 0 && isMale == true ||
                    isFemale == true) {
                  Calculate bmiCalculate =
                      Calculate(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                            bmiResult: bmiCalculate.calculateBMI(),
                            result: bmiCalculate.getResults(),
                            review: bmiCalculate.getReview()),
                      ));
                }
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
                  'Calculate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ));
  }
}

class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  RoundButton({required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: () {
        onPressed();
      },
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      elevation: 7,
      child: icon,
    );
  }
}
