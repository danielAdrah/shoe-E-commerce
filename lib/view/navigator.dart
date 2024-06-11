// ignore_for_file: prefer_const_constructors

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/constants.dart';
import 'bag/bag_view.dart';
import 'home/home_view.dart';
import 'userProfile/user_profile_view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  List<Widget> screens = [
    HomeView(),
    BagView(),
    UserProfileView(),
  ];
  PageController pageController = PageController();
  int selectedIndex = 0;
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTapped,
        iconSize: 27,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Color(0xffacacac),
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart)),
          CustomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
