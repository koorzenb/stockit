import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/item_list_controller.dart';
import 'item_list_tile.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
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
                      final item = itemListController.items[index];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red, // Background color when swiping
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          // Remove the item from the list when swiped
                          itemListController.remove(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text('${item.description} deleted'),
                            ),
                          );
                        },
                        child: ItemListTile(item: item),
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 30,
            child: Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total'), // TODO: set global text theme
                    Text(itemListController.total.toStringAsFixed(2)),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
