// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/utils/constants.dart';

import '../../model/shoe_model.dart';
import '../../theme/custom_app_theme.dart';
import 'components/custome_detail_appBar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {super.key, required this.model, required this.isComeFromMoreSection});
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: CustomDetailsAppBar(),
        body: Container(
          width: size.width,
          height: size.height * 1.1,
          color: Colors.red.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height / 2.3,
                color: Colors.yellow.withOpacity(0.1),
                child: Stack(
                  children: [
                    Positioned(
                      left: 60,
                      bottom: 20,
                      child: FadeInDown(
                        delay: Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                        child: Container(
                          width: size.width,
                          height: size.height / 2.2,
                          decoration: BoxDecoration(
                              color: model.modelColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1500),
                                bottomRight: Radius.circular(100),
                              )),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 30,
                      child: ZoomIn(
                        delay: Duration(milliseconds: 320),
                        curve: Curves.easeInOut,
                        child: Hero(
                          tag: isComeFromMoreSection
                              ? model.model
                              : model.imgAddress,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-25 / 360),
                            child: SizedBox(
                              width: size.width / 1.3,
                              height: size.height / 4.3,
                              child: Image.asset(model.imgAddress),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
