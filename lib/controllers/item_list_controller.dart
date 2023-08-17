import 'package:get/get.dart';
import 'package:stockit/models/item.dart';

class ItemListController extends GetxController {
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
    update();
  }
}
