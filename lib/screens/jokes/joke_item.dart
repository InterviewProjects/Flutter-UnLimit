import 'package:flutter/material.dart';
import 'dart:math' as math;

class JokeItem extends StatelessWidget {
  final String message;
  final Color currentColor;
  final Color nextColor;

  const JokeItem({
    super.key,
    required this.message,
    required this.currentColor,
    required this.nextColor,
  });

  // @override
  // Widget build(BuildContext context) {
  //   final bgColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  //   return Column(
  //     children: [
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
  //         decoration: BoxDecoration(
  //           color: bgColor,
  //           borderRadius: const BorderRadius.only(
  //             bottomLeft: Radius.circular(50.0),
  //           ),
  //         ),
  //         child: Text(
  //           message,
  //           style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600 ),
  //         ),
  //       ),
  //       const SizedBox(height: 4,)
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: currentColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 80.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}
