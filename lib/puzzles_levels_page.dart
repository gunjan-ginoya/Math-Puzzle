import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzles/GetxClass.dart';
import 'package:math_puzzles/puzzle.dart';

class PuzzalesLevelPage extends StatelessWidget {
  PuzzalesLevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SELECT PUZZLE",
                    style: TextStyle(
                        fontFamily: 'Chalk',
                        color: Colors.indigo,
                        fontSize: min(width * 0.06, height * 0.06),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Grid View
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: GetXClass.status.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        int.parse((width * 0.009).floor().toString()),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    if (GetXClass.status.value[index] == "clear") {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            GetXClass.answer.value = "";
                            Get.off(
                              Puzzle(
                                optinalIndex: index + 1,
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/tick.png'),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontFamily: 'Chalk',
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (GetXClass.status.value[index] == "current") {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.off(
                              Puzzle(
                                optinalIndex: index + 1,
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontFamily: 'Chalk',
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      );
                    }else if (GetXClass.status.value[index] == "panding") {
                      return Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/lock.png'),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
