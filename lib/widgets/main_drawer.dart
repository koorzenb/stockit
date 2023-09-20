import 'package:flutter/material.dart';
import 'package:stockit/widgets/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.primary,
          child: const Text(
            'Menu',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        DrawerItem(icon: Icons.add, title: 'Add bank account', onTap: () {})
        // How to set Future on Function???
      ],
    ));
  }
}
