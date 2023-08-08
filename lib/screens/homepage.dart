import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/screens/capture_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: const Center(
        child: Text('nothing here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await Get.to(() => const CaptureItemPage()),
        tooltip: 'Increment',
        child: const Icon(Icons.camera),
      ), // T
    );
  }
}
