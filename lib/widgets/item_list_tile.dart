import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stockit/models/item.dart';

class ItemListTile extends StatelessWidget {
  final Item item;

  const ItemListTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.imagePath != null
          ? Image.file(
              File(item.imagePath!),
            )
          : const Icon(Icons.image),
      title: item.description == null ? null : Text(item.description!),
      trailing: Text(
        item.price.toString(),
        style: const TextStyle(fontSize: 16),
      ), // TODO: add TextTheme
    );
  }
}
