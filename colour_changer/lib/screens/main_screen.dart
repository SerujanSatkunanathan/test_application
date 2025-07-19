import 'dart:math';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor = Colors.black;

  //Colour changing function
  void colourChange() {
    final random = Random();
    setState(() {
      backgroundColor = Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: GestureDetector(
        onTap: colourChange, //Colour will change when the user tap the screen
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: backgroundColor),
          child: Column(children: [Text("Hii There")]),
        ),
      ),
    );
  }
}
