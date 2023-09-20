import 'package:flutter/material.dart';
import 'package:stockit/models/item.dart';

class ItemListTile extends StatelessWidget {
  final Item item;

  const ItemListTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 20,
        child: item.image ?? const Icon(Icons.image),
      ),
      title: item.description == null ? null : Text(item.description!),
      subtitle: item.quantity > 1
          ? Text(
              '${item.price} x ${item.quantity}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8, color: Theme.of(context).colorScheme.primary),
            )
          : null,
      trailing: Text((item.price * item.quantity).toString()),
    );
  }
}

// TODO:
// item:
// - long tap to edit

// drawer:
// - clear items
// - add new banking details
