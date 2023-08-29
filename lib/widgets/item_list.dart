import 'package:flutter/material.dart';
import 'package:stockit/controllers/item_list_controller.dart';

import '../models/item.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = ItemListController.getOrPut.items;

    return Column(
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[0].description!),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('R20'),
              ],
            ),
          ),
        ),
      ],
    );

    // return GetBuilder<ItemListController>(builder: (itemListController) {
    //   return ListView.builder(
    //     itemCount: itemListController.items.length,
    //     itemBuilder: (context, index) {
    //       // String itemKey = items.keys.elementAt(index);
    //       Item item = itemListController.items[index];
    //       return ListTile(
    //         leading: item.image ?? const Icon(Icons.image),
    //         title: item.description == null ? null : Text(item.description!),
    //         trailing: Text(item.price.toString()),
    //       );
    //     },
    //   );
    // });
  }
}
