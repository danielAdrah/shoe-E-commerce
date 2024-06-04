// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sneakers_shop/data/dummy_data.dart';

import '../../model/shoe_model.dart';
import '../../theme/custom_app_theme.dart';
import '../../utils/constants.dart';
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
              Row(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  featured[index],
                                  style: TextStyle(
                                      fontSize:
                                          selectedFeature == index ? 20 : 17,
                                      color: selectedFeature == index
                                          ? AppConstantsColor.darkTextColor
                                          : AppConstantsColor
                                              .unSelectedTextColor,
                                      fontWeight: selectedFeature == index
                                          ? FontWeight.w600
                                          : FontWeight.w400),
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                  Container(
                    width: size.width * 0.89,
                    height: size.height * 0.4,
                    // color: Colors.red,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: availableShoes.length,
                        itemBuilder: ((context, index) {
                          ShoeModel model = availableShoes[index];
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                  vertical: size.height * 0.01),
                              child: Stack(
                                // alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: size.width / 1.81,
                                    decoration: BoxDecoration(
                                      color: model.modelColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: FadeInDown(
                                      delay: Duration(milliseconds: 400),
                                      curve: Curves.decelerate,
                                      child: Row(
                                        children: [
                                          Text(model.name,
                                              style: AppThemes.homeProductName),
                                          SizedBox(width: size.width * 0.3),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 10,
                                    child: FadeInDown(
                                      delay: Duration(milliseconds: 500),
                                      curve: Curves.decelerate,
                                      child: Text(
                                        model.model,
                                        style: AppThemes.homeProductModel,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 10,
                                    child: FadeInDown(
                                      delay: Duration(milliseconds: 580),
                                      curve: Curves.decelerate,
                                      child: Text(
                                        "\$${model.price.toStringAsFixed(2)}",
                                        style: AppThemes.homeProductPrice,
                                      ),
                                    ),
                                  ),
                                  FadeInDown(
                                    delay: Duration(milliseconds: 600),
                                    curve: Curves.decelerate,
                                    child: Hero(
                                      tag: model.imgAddress,
                                      child: RotationTransition(
                                        turns:
                                            AlwaysStoppedAnimation(-30 / 360),
                                        child: SizedBox(
                                          height: 230,
                                          width: 250,
                                          child: Image(
                                              image:
                                                  AssetImage(model.imgAddress)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
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
