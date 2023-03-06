import 'package:flutter/material.dart';

class Ctm_Card extends StatelessWidget {
  final Color color;
  final Widget child;
  void Function() onTap;
  Animation<Offset> position;

  Ctm_Card(
      {required this.position,
      required this.child,
      required this.onTap,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: position,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          child: child,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
        ),
      ),
    );
  }
}
