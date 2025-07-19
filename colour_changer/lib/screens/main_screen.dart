import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColour = Colors.black;

  //Colour changing function
  void colourChange() {
    final random = Random();
    setState(() {
      backgroundColour = Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showIntroDialog();
  }

  // Intro dialog
  void showIntroDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Space Alert!"),
            content: const Text("Tap anywhere to change the space colour."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        backgroundColour.computeLuminance() <
        0.5; //to find the colour is dark or bright
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: GestureDetector(
        onTap: colourChange, //Colour will change when the user tap the screen
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: backgroundColour),
          child: Stack(
            children: [
              Positioned(
                top: -screenHeight * 0.4,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  "assets/images/moon.svg",
                  width: screenWidth * 1,
                  height: screenHeight * 0.8,
                ),
              ),
              Positioned(
                top: screenHeight * 0.45,
                bottom: 10,
                left: 10,
                right: 10,
                child: Transform.scale(
                  scale: 1.2,
                  child: Image.asset("assets/images/16949.png"),
                ),
              ),
              Positioned(
                top: screenHeight * 0.35,
                left: 0,
                right: 0,

                child: Align(
                  child: Text(
                    "Hii There!",
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
