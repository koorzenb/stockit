import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/widgets/item_list_tile.dart';

import '../controllers/item_list_controller.dart';

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
                      return ItemListTile(item: itemListController.items[index]);
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
                    Text(itemListController.total.toString()),
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
