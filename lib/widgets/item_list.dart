import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/item_list_controller.dart';
import '../models/item.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = ItemListController.getOrPut.items;

    return GetBuilder<ItemListController>(builder: (itemListController) {
      return Column(
        children: [
          Expanded(
            child: itemListController.items.isEmpty
                ? const Center(
                    child: Text('Add some items...'),
                  )
                : ListView.builder(
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
                  ),
          ),
          SizedBox(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'), // TODO: set global text theme
                  Text(itemListController.total.toString()),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
