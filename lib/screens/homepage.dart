import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/controllers/item_list_controller.dart';
import 'package:stockit/screens/capture_item_page.dart';

import '../widgets/inventory_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, Map<String, dynamic>> items;

  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }

  // TODO: idea: click share -> navigate to select customer bank (eg ABSA) -> once selected, navigate to sharing panel -> select "WhatsApp" -> on WhatsApp message populate with our ABSA details and price
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StockIt'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        // foregroundColor: Colors.white,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: const InventoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.camera),
      ), // T
    );
  }

  _onPressed() async {
    final capturedItem = await Get.to(() => const CaptureItemPage());
    if (capturedItem != null) {
      ItemListController.getOrPut.add(capturedItem);
    }
  }
}
