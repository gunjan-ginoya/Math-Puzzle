import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzles/puzzle.dart';
import 'package:math_puzzles/puzzles_levels_page.dart';

import 'package:flutter/services.dart';

import 'GetxClass.dart';

void main() {

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  GetXClass getxc = Get.put(GetXClass());

  RxBool isContainerSelect = false.obs;
  RxBool ispuzzlesSelect = false.obs;
  RxBool isbuyproSelect = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MATH PUZZLES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Chalk",
                      fontSize: 30,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
            ),

            // Main Board
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 550,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/blackboard_main_menu.png"),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Continue
                  Listener(
                    onPointerDown: (details) {
                      isContainerSelect.value = true;
                    },
                    onPointerUp: (details) {
                      isContainerSelect.value = false;
                      Get.to(Puzzle());
                    },
                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: isContainerSelect.value
                              ? Border.all(color: Colors.white)
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                            fontFamily: "Chalk",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 15),
                  // Puzzles
                  Listener(
                    onPointerDown: (details) {
                      ispuzzlesSelect.value = true;
                    },
                    onPointerUp: (details) {
                      ispuzzlesSelect.value = false;
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PuzzalesLevelPage(),));
                      Get.to(PuzzalesLevelPage());
                    },
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: ispuzzlesSelect.value
                              ? Border.all(color: Colors.white)
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "PUZZLES",
                          style: TextStyle(
                            fontFamily: "Chalk",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 15),
                  // Buy Pro
                  Listener(
                    onPointerDown: (details) {
                      isbuyproSelect.value = true;
                    },
                    onPointerUp: (details) {
                      isbuyproSelect.value = false;
                    },
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: isbuyproSelect.value
                              ? Border.all(color: Colors.white)
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "BYE PRO",
                          style: TextStyle(
                            fontFamily: "Chalk",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Share Part
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // AD Button
                  Column(
                    children: [
                      Text(
                        "AD",
                        style: TextStyle(
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        child: Image(
                          image: AssetImage("images/ltlicon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  // Share, E-mial, Policy
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 40,
                            width: 40,
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
                            child: Image(
                              image: AssetImage('images/shareus.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 40,
                            width: 40,
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
                            child: Image(
                              image: AssetImage('images/emailus.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text("PRIVACY POLICY"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
