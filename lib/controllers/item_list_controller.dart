import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/item.dart';

class ItemListController extends GetxController {
  double total = 0.0;
  List<Item> items = [];

  static ItemListController get getOrPut {
    try {
      return Get.find<ItemListController>();
    } catch (e) {
      return Get.put(ItemListController._());
    }
  }

  ItemListController._();

  add(Item item) {
    items.add(item);
    total += item.price;
    debugPrint('total = $total');
    update();
  }

  remove(Item item) {
    items.removeWhere((element) => item == element);
    total -= item.price;
    update();
  }
}
