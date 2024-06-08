// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:sneakers_shop/data/dummy_data.dart';

import '../../model/shoe_model.dart';
import '../../theme/custom_app_theme.dart';
import '../../utils/constants.dart';
import '../details/details_view.dart';
import 'components/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategory = 0;
  int selectedFeature = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              categoryView(size),
              SizedBox(height: size.height * 0.04),
              mainShoesListView(size),
              moreTextAndButton(),
              bottomSideCategory(size),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.28,
      child: ListView.builder(
          itemCount: availableShoes.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            ShoeModel model = availableShoes[index];
            return InkWell(
              onTap: () {
                Get.to(DetailsView(
                  isComeFromMoreSection: true,
                  model: model,
                ));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 4,
                      child: FadeInDown(
                        delay: Duration(milliseconds: 400),
                        curve: Curves.decelerate,
                        child: Container(
                          width: size.width / 13,
                          height: size.height / 10,
                          color: Colors.red,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Center(
                                child: ZoomIn(
                              delay: Duration(milliseconds: 600),
                              curve: Curves.decelerate,
                              child: Text(
                                "NEW",
                                style: AppThemes.homeGridNewText,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                    Positioned(
                      top: 55,
                      child: FadeInDown(
                        delay: Duration(milliseconds: 400),
                        curve: Curves.decelerate,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-15 / 360),
                          child: Hero(
                            tag: model.model,
                            child: Image.asset(
                              model.imgAddress,
                              width: size.width * 0.45,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: FadeInDown(
                          delay: Duration(milliseconds: 450),
                          curve: Curves.decelerate,
                          child: FittedBox(
                            child: Text(
                              "${model.name} ${model.model}",
                              style: AppThemes.homeGridNameAndModel,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding moreTextAndButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("More", style: AppThemes.homeMoreText),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.arrow_right))
        ],
      ),
    );
  }

  Row mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 15,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: featured.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedFeature = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize: selectedFeature == index ? 20 : 17,
                            color: selectedFeature == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedFeature == index
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ),
                  );
                })),
          ),
        ),
        SizedBox(
          width: size.width * 0.89,
          height: size.height * 0.33,
          // color: Colors.red,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableShoes.length,
              itemBuilder: ((context, index) {
                ShoeModel model = availableShoes[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsView(
                        isComeFromMoreSection: false, model: model));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.005,
                        vertical: size.height * 0.01),
                    width: size.width / 1.5,
                    child: Stack(
                      // clipBehavior: ,
                      children: [
                        Container(
                          width: size.width / 1.85,
                          decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 13,
                          child: FadeInDown(
                            delay: Duration(milliseconds: 450),
                            curve: Curves.decelerate,
                            child: Row(
                              children: [
                                Text(
                                  model.name,
                                  style: AppThemes.homeProductName,
                                ),
                                // SizedBox(width: size.width * 0.3),
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       Icons.favorite_border,
                                //       color: Colors.white,
                                //     ))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 10,
                          child: FadeInDown(
                              delay: Duration(milliseconds: 600),
                              curve: Curves.decelerate,
                              child: Text(
                                "\$${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeProductPrice,
                              )),
                        ),
                        FadeInDown(
                          delay: Duration(milliseconds: 650),
                          curve: Curves.decelerate,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-30 / 360),
                              child: Container(
                                width: 250,
                                height: 230,
                                child: Image.asset(model.imgAddress),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 175,
                          bottom: 5,
                          child: ZoomIn(
                            delay: Duration(milliseconds: 600),
                            curve: Curves.decelerate,
                            child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.circleArrowRight,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 215,
                          left: 10,
                          child: FadeInDown(
                              delay: Duration(milliseconds: 550),
                              curve: Curves.decelerate,
                              child: Text(
                                model.model,
                                style: AppThemes.homeProductModel,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              })),
        )
      ],
    );
  }

  Widget categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedCategory == index ? 22 : 18,
                          color: selectedCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedCategory == index
                              ? FontWeight.bold
                              : FontWeight.w400),
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }
}
