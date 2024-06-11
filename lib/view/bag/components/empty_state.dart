// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_shop/theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              delay: Duration(milliseconds: 400),
              curve: Curves.decelerate,
              child: Text(
                "No Shoes Added",
                style: AppThemes.bagEmptyListTitle,
              )),
          FadeInDown(
              delay: Duration(milliseconds: 400),
              curve: Curves.decelerate,
              child: Text(
                "Once You Have Added Come Back",
                style: AppThemes.bagEmptyListSubTitle,
              )),
        ],
      ),
    );
  }
}
