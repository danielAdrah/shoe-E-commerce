import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class CustomDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
   CustomDetailsAppBar({
    super.key,
  });
 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Nike",
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back),
        color: AppConstantsColor.darkTextColor,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
