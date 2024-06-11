import 'package:flutter/material.dart';
import 'package:sneakers_shop/data/dummy_data.dart';
import 'package:sneakers_shop/model/models.dart';

import '../components/custom_snak_bar.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    //to check weather we have this item in the bag already
    bool contains = itemsOnBag.contains(data);
    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnakBar.failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnakBar.successSnackBar());
    }
  }

  static double allItemsOnBag() {
    double totalPrice = 0;
    for (ShoeModel item in itemsOnBag) {
      totalPrice += item.price;
    }
    return totalPrice;
  }
}
