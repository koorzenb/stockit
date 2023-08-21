import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/controllers/item_list_controller.dart';

import '../models/item.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemListController>(builder: (itemListController) {
      return ListView.builder(
        itemCount: itemListController.items.length,
        itemBuilder: (context, index) {
          // String itemKey = items.keys.elementAt(index);
          Item item = itemListController.items[index];
          return ListTile(
            leading: item.image ?? const Icon(Icons.image),
            title: item.description == null ? null : Text(item.description!),
            trailing: Text(item.price.toString()),
          );
        },
      );
    });
  }
}
