import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockit/controllers/item_list_controller.dart';
import 'package:stockit/screens/homepage.dart';

void main() {
  ItemListController.getOrPut;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stockit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
