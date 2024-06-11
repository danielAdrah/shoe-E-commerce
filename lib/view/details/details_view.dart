// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sneakers_shop/data/dummy_data.dart';
import 'package:sneakers_shop/utils/constants.dart';

import '../../model/shoe_model.dart';
import '../../theme/custom_app_theme.dart';
import '../../utils/app_methods.dart';
import 'components/custome_detail_appBar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {super.key, required this.model, required this.isComeFromMoreSection});
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool isCountrySelected = false;
  int? isSizeSelected;

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                topProductImageAndBg(size),
                FadeInDown(
                  delay: Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                        (index) => index == 3
                            ? Container(
                                padding: EdgeInsets.all(2),
                                width: size.width / 5,
                                height: size.height / 14,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(widget.model.imgAddress),
                                        fit: BoxFit.contain,
                                        colorFilter: ColorFilter.mode(
                                            Colors.grey.withOpacity(1),
                                            BlendMode.darken))),
                                child: Center(
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: AppConstantsColor.lightTextColor,
                                    size: 30,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                child: roundedImage(size.width, size.height),
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Divider(indent: 30, endIndent: 30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productNameAndPrice(),
                      productInfo(size.width, size.height),
                      moreDetails(size.width, size.height),
                      sizeAndCountry(size),
                      sizeSelection(size),
                      materialButton(size.width, size.height),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget materialButton(width, height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: FadeInDown(
          delay: Duration(milliseconds: 400),
          curve: Curves.decelerate,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minWidth: width / 1.2,
            height: height / 15,
            color: widget.model.modelColor,
            onPressed: () {
              AppMethods.addToCart(widget.model, context);
            },
            child: Text(
              "ADD TO BAG",
              style: TextStyle(color: AppConstantsColor.lightTextColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget sizeSelection(Size size) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: size.width,
      height: size.height * 0.07,
      child: FadeInDown(
        delay: Duration(milliseconds: 400),
        curve: Curves.decelerate,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 4.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Try it",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RotatedBox(
                        quarterTurns: -1,
                        child: FaIcon(FontAwesomeIcons.shoePrints))
                  ],
                ),
              ),
            ),
            // SizedBox(width: 15),
            Container(
              width: size.width * 0.6,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSizeSelected = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: isSizeSelected == index
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1.5),
                          color: isSizeSelected == index
                              ? Colors.black
                              : AppConstantsColor.backgroundColor,
                        ),
                        child: Center(
                          child: Text(sizes[index].toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSizeSelected == index
                                      ? Colors.white
                                      : Colors.black)),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeAndCountry(Size size) {
    return FadeInDown(
      delay: Duration(milliseconds: 400),
      curve: Curves.decelerate,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Size",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
                fontSize: 22,
              ),
            ),
            Container(
              width: size.width * 0.35,
              height: size.height * 0.05,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isCountrySelected = !isCountrySelected;
                        });
                      },
                      child: Text(
                        "UK",
                        style: TextStyle(
                            fontWeight: isCountrySelected
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color:
                                isCountrySelected ? Colors.black : Colors.grey),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isCountrySelected = !isCountrySelected;
                        });
                      },
                      child: Text(
                        "USA",
                        style: TextStyle(
                            fontWeight: !isCountrySelected
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: !isCountrySelected
                                ? Colors.black
                                : Colors.grey),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moreDetails(width, height) {
    return FadeInDown(
      delay: Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Container(
        padding: EdgeInsets.only(right: 280),
        height: height / 26,
        child: Padding(
          padding: EdgeInsets.only(top: 12),
          child: InkWell(
            onTap: () {},
            child: Text(
              "More Details",
              style: AppThemes.detailsMoreText,
            ),
          ),
        ),
      ),
    );
  }

  Widget productInfo(width, height) {
    return FadeInDown(
      delay: Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: width,
          height: height / 9,
          child: Text(
            "here should be some information about this sneaker , but since i don't have a backend yet i wrote some nonesense here temporary, so thank you for reading it rigth now and if you still here thank you for your time",
            style: AppThemes.detailsProductDescriptions,
          ),
        ),
      ),
    );
  }

  Widget productNameAndPrice() {
    return FadeInDown(
        delay: Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: Row(
          children: [
            Text(widget.model.model,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: AppConstantsColor.darkTextColor)),
            Expanded(
              child: Container(),
            ),
            Text(
              "\$${widget.model.price.toStringAsFixed(2)}",
              style: AppThemes.detailsProductPrice,
            ),
          ],
        ));
  }

  Widget topProductImageAndBg(Size size) {
    return Container(
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
                    color: widget.model.modelColor,
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
                tag: widget.isComeFromMoreSection
                    ? widget.model.model
                    : widget.model.imgAddress,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-25 / 360),
                  child: SizedBox(
                    width: size.width / 1.3,
                    height: size.height / 4.3,
                    child: Image.asset(widget.model.imgAddress),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
        padding: EdgeInsets.all(2),
        width: width / 5,
        height: height / 14,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image(image: AssetImage(widget.model.imgAddress)));
  }
}
