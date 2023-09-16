import 'package:flutter/material.dart';
import 'package:stockit/models/item.dart';

class ItemListTile extends StatelessWidget {
  final Item item;

  const ItemListTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.image != null
          ? SizedBox(
              height: 30,
              width: 30,
              child: item.image,
            )
          : const Icon(Icons.image),
      title: item.description == null ? null : Text(item.description!),
      trailing: Text(
        item.price.toStringAsFixed(2),
        style: const TextStyle(fontSize: 16),
      ), // TODO: add TextTheme
    );
  }
}
