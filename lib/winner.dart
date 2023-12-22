import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzles/GetxClass.dart';
import 'package:math_puzzles/main.dart';
import 'package:math_puzzles/puzzle.dart';

class Winner extends StatelessWidget {
  const Winner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PUZZLE ${GetXClass.index.value} COMPLETED",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.06,
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.12),
                  height: 400,
                  alignment: Alignment.center,
                  child: Image.asset('images/trophy.png'),
                ),

                // continue button
                GestureDetector(
                  onTap: () {
                    Get.off(Puzzle());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width * 0.5,
                    height: height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.grey,
                          Colors.white,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: const Text(
                      "CONTINUE",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Get.offAll(HomePage()),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width * 0.5,
                    height: height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.grey,
                          Colors.white,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: const Text(
                      "MAIN MENU",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.5,
                  height: height * 0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.grey,
                        Colors.white,
                        Colors.grey,
                      ],
                    ),
                  ),
                  child: const Text(
                    "BUY PRO",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
