// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_shop/data/dummy_data.dart';
import 'package:sneakers_shop/model/models.dart';
import 'package:sneakers_shop/utils/constants.dart';

import '../../theme/custom_app_theme.dart';
import '../../utils/app_methods.dart';
import 'components/empty_state.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthOfBag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                customAppBar(width, height),
                itemsOnBag.isEmpty
                    ? EmptyState()
                    : Column(
                        children: [
                          mainListView(width, height),
                          bottomInfo(width, height),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomInfo(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 400),
            curve: Curves.decelerate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: AppThemes.bagProductPrice,
                  ),
                  Text(
                    "\$${AppMethods.allItemsOnBag()}",
                    style: AppThemes.bagSumOfItemOnBag,
                  ),
                ],
              ),
            ),
          ),
          materialButton(width, height),
        ],
      ),
    );
  }

  Widget materialButton(width, height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FadeInDown(
          delay: Duration(milliseconds: 400),
          curve: Curves.decelerate,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minWidth: width / 1.2,
            height: height / 15,
            color: AppConstantsColor.materialButtonColor,
            onPressed: () {
              // AppMethods.addToCart(widget.model, context);
            },
            child: Text(
              "Next",
              style: TextStyle(color: AppConstantsColor.lightTextColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget mainListView(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.7,
      child: ListView.builder(
          itemCount: itemsOnBag.length,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            ShoeModel itemBag = itemsOnBag[index];
            return FadeInLeft(
              delay: Duration(milliseconds: 400),
              curve: Curves.decelerate,
              child: Container(
                margin: EdgeInsets.all(10),
                width: width,
                height: height * 0.2,
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: itemBag.modelColor.withOpacity(0.7)),
                          ),
                          Positioned(
                            right: 2,
                            bottom: 15,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-40 / 360),
                              child: SizedBox(
                                width: 140,
                                height: 140,
                                child: Image(
                                  image: AssetImage(itemBag.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemBag.model,
                          style: AppThemes.bagProductModel,
                        ),
                        SizedBox(height: 3),
                        Text(
                          "\$${itemBag.price.toStringAsFixed(2)}",
                          style: AppThemes.bagProductPrice,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  itemsOnBag.remove(itemBag);
                                  lengthOfBag = itemsOnBag.length;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[350]),
                                child: Icon(Icons.remove, size: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "1",
                                style: AppThemes.bagProductNumOfShoe,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[350]),
                                child: Icon(Icons.add, size: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(width: 5),
                  ],
                ),
              ),
            );
          })),
    );
  }

  Widget customAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeInDown(
          delay: Duration(milliseconds: 300),
          curve: Curves.decelerate,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("M y B a g", style: AppThemes.bagTitle),
                Text("Total $lengthOfBag items", style: AppThemes.bagTotalPrice)
              ],
            ),
          )),
    );
  }
}
