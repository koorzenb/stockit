import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/screens/capture_item_page.dart';

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
      items = {
        "Item1": {'description': 'item1 name', 'price': 12.99},
        "Item2": {'description': 'item2 name', 'price': 5.99},
      };
      super.initState();
    });
  }

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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String itemKey = items.keys.elementAt(index);
          Map<String, dynamic> item = items[itemKey]!;
          final description = item['description'];
          final price = item['price']; // TODO: convert this all to a stless widget
          return ListTile(
            leading: const Icon(Icons.image),
            title: Text(description),
            trailing: Text(price.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await Get.to(() => const CaptureItemPage()),
        tooltip: 'Increment',
        child: const Icon(Icons.camera),
      ), // T
    );
  }
}
