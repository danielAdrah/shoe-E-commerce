import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final double height = kToolbarHeight;
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "Discover",
          style: AppThemes.homeAppBar,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              size: 25,
              color: AppConstantsColor.darkTextColor,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 25,
              color: AppConstantsColor.darkTextColor,
            ))
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(70);
}
