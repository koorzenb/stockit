import 'package:flutter/material.dart';

import '../models/item.dart';

class InventoryList extends StatelessWidget {
  final List<Item> items;

  const InventoryList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        // String itemKey = items.keys.elementAt(index);
        Item item = items[index];
        return ListTile(
          leading: const Icon(Icons.image),
          title: Text(item.description),
          trailing: Text(item.price.toString()),
        );
      },
    );
  }
}
