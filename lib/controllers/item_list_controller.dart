import 'package:get/get.dart';

import '../models/item.dart';

class ItemListController extends GetxController {
  double total = 0.0;
  List<Item> items = [
    Item(description: 'item1', price: 12.99),
    Item(description: 'item2', price: 5.99),
  ];

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
    update();
  }
}
