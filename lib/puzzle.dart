import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzles/GetxClass.dart';
import 'package:math_puzzles/main.dart';
import 'package:math_puzzles/winner.dart';

class Puzzle extends StatelessWidget {
  int? optinalIndex;

  Puzzle({Key? key, this.optinalIndex});

  late double width;
  late double height;
  late Timer _timer;
  static RxInt remainingSeconds = 0.obs;

  @override
  Widget build(BuildContext context) {
    // index.value = GetXClass.prefs!.getInt("level")??0;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    GetXClass.prefs!.setString("${GetXClass.index.value}", "current");
    GetXClass.status[GetXClass.index.value] = "current";

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/gameplaybackground.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(top: min(width * 0.045, height * 0.045)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(min(width * 0.070, height * 0.070)),
                    margin: EdgeInsets.symmetric(vertical: width * 0.05),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/level_board.png'),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: optinalIndex != null
                        ? getText(title: "Puzzle ${optinalIndex}")
                        : Obx(
                            () => getText(
                                title: "Puzzle ${GetXClass.index.value + 1}"),
                          ),
                  ),
                  // Puzzle question
                  Container(
                    height: 350,
                    width: max(width * 0.345, height * 0.345),
                    alignment: Alignment.topCenter,
                    child: optinalIndex != null
                        ? Image(
                            image: AssetImage('levels/p${optinalIndex}.png'))
                        : Obx(
                            () => Image(
                              image: AssetImage(
                                  'levels/p${GetXClass.index.value + 1}.png'),
                            ),
                          ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                alignment: Alignment.centerLeft,
                                height: 50,
                                margin: const EdgeInsets.all(7),
                                child: Text(
                                  GetXClass.answer.value,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Delete Button
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (GetXClass.answer.value.length > 0) {
                                  GetXClass.answer.value =
                                      GetXClass.answer.value.substring(
                                          0, GetXClass.answer.value.length - 1);
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                margin: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: const Image(
                                  image: AssetImage("images/delete.png"),
                                ),
                              ),
                            ),
                          ),

                          // Submit button
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                if (optinalIndex == null && GetXClass.answer.value.isNotEmpty) {
                                  GetXClass.answer.value = "";
                                  GetXClass.prefs!.setString(
                                      "${GetXClass.index.value}", "clear");
                                  GetXClass.status[GetXClass.index.value] =
                                      'clear';
                                  GetXClass.index.value++;
                                  GetXClass.prefs!
                                      .setInt("level", GetXClass.index.value);
                                  Get.off(const Winner());
                                } else {
                                  if(GetXClass.answer.value.isNotEmpty){
                                    GetXClass.answer.value = "";
                                    GetXClass.prefs!.setString(
                                        "${optinalIndex! - 1}", "clear");
                                    GetXClass.status[optinalIndex! - 1] = 'clear';
                                    GetXClass.index.value++;
                                    GetXClass.prefs!
                                        .setInt("level", GetXClass.index.value);
                                    Get.off(HomePage());
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: const Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 5),

                        // Button 1
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "1";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 2
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "2";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 3
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "3";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 4
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "4";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "4",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 5
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "5";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "5",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 6
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "6";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "6",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 7
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "7";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "7",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 8
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "8";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "8",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 9
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "9";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "9",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),

                        // Button 0
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              GetXClass.answer.value += "0";
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade800,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "0",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Functions
  Widget getText({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: min(width * 0.042, height * 0.042),
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void startCountdown() {
    if (remainingSeconds.value == 60) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
        } else {
          _timer.cancel();
        }
      });
    }
  }

  String ConverTime(int second) {
    int hour = second ~/ 3600;
    int minutes = (second % 3600) ~/ 60;
    int seconds = second % 60;

    String finalTime = "${hour} : ${minutes} : ${seconds}";
    return finalTime;
  }
}
