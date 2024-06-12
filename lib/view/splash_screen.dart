// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
// MainNavigator

class _SplashScreenState extends State<SplashScreen> {
  startApp() async {
    await Future.delayed(Duration(milliseconds: 4000));
    Get.to(const MainNavigator());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: media.width,
          height: media.height,
          child: Stack(
            children: [
              FadeInDown(
                delay: Duration(milliseconds: 700),
                curve: Curves.decelerate,
                child: Container(
                  width: media.width,
                  height: media.height * 0.35,
                  decoration: BoxDecoration(
                      color: Color(0xffDE0106),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(250),
                        // bottomRight: Radius.circular(50)
                      )),
                ),
              ),
              Positioned(
                top: 100,
                left: 50,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-22 / 360),
                  child: ElasticIn(
                    delay: Duration(milliseconds: 1400),
                    curve: Curves.elasticOut,
                    child: Image(
                      image: AssetImage("assets/images/nike1.png"),
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 410,
                left: 70,
                child: ZoomIn(
                  delay: Duration(milliseconds: 800),
                  curve: Curves.decelerate,
                  child: Text(
                    "Just Do It with Nike ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 600,
                left: 180,
                child: SpinKitSpinningLines(
                  
                  color: Color(0xffDE0106),
                  size: 50.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
